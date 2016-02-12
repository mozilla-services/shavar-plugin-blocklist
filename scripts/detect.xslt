<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

	<xsl:template match="*"/>

	<xsl:template match="/">
    	<xsl:apply-templates select="swf/Header/tags/*"/>
    </xsl:template>

    <xsl:template match="DoAction | DoABC | DoABCDefine">
		<xsl:variable name="strings" select="actions/Dictionary/strings/String | actions/Action3/constants/Constants/strings/String2"/>
		
		<xsl:variable name="usesExternalInterface" select="$strings[@value='ExternalInterface']"/>
		<xsl:variable name="enumeratesFonts" select="$strings[@value='enumerateFonts']"/>
		<xsl:variable name="usesSharedObject" select="$strings[@value='SharedObject']"/>
		<xsl:variable name="usesGetLocal" select="$strings[@value='getLocal']"/>
		<xsl:variable name="hasCookieString" select="$strings[@value='cookie'] | $strings[@value='Cookie']"/>
		
		<xsl:if test="$usesExternalInterface and $enumeratesFonts">
			<xsl:text>Fingerprinting</xsl:text>
			<xsl:text>&#xa;</xsl:text>
		</xsl:if>
		
		<xsl:if test="$usesSharedObject and $usesGetLocal and $hasCookieString">
			<xsl:text>Supercookie</xsl:text>
			<xsl:text>&#xa;</xsl:text>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
