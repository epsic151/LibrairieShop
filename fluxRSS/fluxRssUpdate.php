<?php
////////////////////////////////// ---------- Entête du programme ---------- //////////////////////////////////
	#################################################################
	#
	#	Programme:		fluxRssUpdate.php 
	#	Auteur:		Raphaël Dufour
	#
	#################################################################
	#
	# 	Date :		janvier 2017
	#	Version :		1.0
	#	Révisions :		
	#
	#################################################################
	#
	#	Function update() adds the new inserted book's title and other details in the news:
	#
	#################################################################

function updateRSSfeeder($title,$author,$description)
{
	// Open xml file to insert new entry:
	if (file_exists($_SERVER['DOCUMENT_ROOT']."/fluxRSS/libraryFlux.xml"))
	{
		// Use DOMdocument parser:
		$xmlRss = new DOMDocument();
		$xmlRss->formatOutput = true;
		$xmlRss->load($_SERVER['DOCUMENT_ROOT']."/fluxRSS/libraryFlux.xml");

		$nodeItem = $xmlRss->createElement("item");
		$subnodetitle = $xmlRss->createElement("title");
		$subnodeauthor = $xmlRss->createElement("author");
		$subnodedescr = $xmlRss->createElement("description");
		$subnodelink = $xmlRss->createElement("link");

		$subnodetitle->appendChild($xmlRss->createTextNode((string)$title));
		$subnodeauthor->appendChild($xmlRss->createTextNode((string)$author));
		$subnodedescr->appendChild($xmlRss->createTextNode((string)$description));
		$subnodelink->appendChild($xmlRss->createTextNode("127.0.0.1/LibraryShop/index.php"));
		
		$nodeItem->appendChild($subnodetitle);
		$nodeItem->appendChild($subnodeauthor);
		$nodeItem->appendChild($subnodedescr);
		$nodeItem->appendChild($subnodelink);
		// Get the first element item to insert the new one before:
		$firstItem = $xmlRss->getElementsByTagName("item")->item(0);
		
		// If more than 10 item, remove last:
		if ($xmlRss->getElementsByTagName("item")->length == 10 )
		{
			$lastItem = $xmlRss->getElementsByTagName("item")->item($xmlRss->getElementsByTagName("item")->length - 1);
			$xmlRss->removeChild($lastItem);
			}
		// Insert the new item at first place:
		$firstItem->parentNode->insertBefore($nodeItem, $xmlRss->getElementsByTagName("item")->item(0));
		// Save new file:
		$xmlRss->save($_SERVER['DOCUMENT_ROOT']."/fluxRSS/libraryFlux.xml");
		}

	}
?>