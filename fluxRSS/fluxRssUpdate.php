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
		$xmlRss->load($_SERVER['DOCUMENT_ROOT']."/fluxRSS/libraryFlux.xml");

		$nodeItem = $xmlRss->createElement("item");
		$subnodetitle = $xmlRss->createElement("title");
		$subnodeauthor = $xmlRss->createElement("author");
		$subnodedescr = $xmlRss->createElement("description");
		$nodeTitle = $xmlRss->createTextNode((string)$title);
		$nodeAuth = $xmlRss->createTextNode((string)$author);
		$nodeDescr = $xmlRss->createTextNode((string)$description);
		$subnodetitle->appendChild($nodeTitle);
		$subnodeauthor->appendChild($nodeAuth);
		$subnodedescr->appendChild($nodeDescr);
		$nodeItem->appendChild($subnodetitle);
		$nodeItem->appendChild($subnodeauthor);
		$nodeItem->appendChild($subnodedescr);
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