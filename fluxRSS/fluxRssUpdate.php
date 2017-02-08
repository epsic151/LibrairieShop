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
	echo "COUCOU";
	// Open xml file to insert new entry:
	if (file_exists($_SERVER['DOCUMENT_ROOT']."/fluxRSS/libraryFlux.xml"))
	{
		echo "<p>file exists.</br><p>";
		// Use DOMdocument parser:
		$xmlRss = new DOMDocument();
		$xmlRss->load($_SERVER['DOCUMENT_ROOT']."/fluxRSS/libraryFlux.xml");
		echo $xmlRss->saveXML();

		$nodeItem = $xmlRss->createElement("item");
		$nodeTitle = $xmlRss->createTextNode((string)$title);
		$nodeAuth = $xmlRss->createTextNode((string)$author);
		$nodeDescr = $xmlRss->createTextNode((string)$description);
		$nodeItem->appendChild($nodeTitle);
		$nodeItem->appendChild($nodeAuth);
		$nodeItem->appendChild($nodeDescr);
		// Get the first element item to insert the new one before:
		$firstItem = $xmlRss->getElementsByTagName("item")->item(0);
		echo "<p>Number of elements:".$xmlRss->getElementsByTagName("item")->length."</br><p>";
		
		// If more than 10 item, remove last:
		if ($xmlRss->getElementsByTagName("item")->length == 10 )
		{
			$lastItem = $xmlRss->getElementsByTagName("item")->item($xmlRss->getElementsByTagName("item")->length - 1);
			$xmlRss->removeChild($lastItem);
			}
		$firstItem->appendChild($nodeItem);
		$xmlRss->save('libraryFlux.xml');
		}

	}
?>