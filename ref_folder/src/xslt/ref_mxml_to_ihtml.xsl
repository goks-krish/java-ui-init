<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:set="http://exslt.org/sets" exclude-result-prefixes="exsl set">

<!--
	/*************************************************************************
	 *
	 * Copyright (c) 2005+ MedHand International AB
	 * All rights reservered.
	 *
	 *************************************************************************/
	/*
	 * @(#)wabcpp_mxml_to_ihtml.xsl
	 *
   * DESCRIPTION:
   * ====================
   * Stylesheet for converting MedHand XML(MXML) to iHtml.
   *
   * OVERRIDES:
   * ====================
   *
	 * CHANGES:
   * ====================
	 */-->
	 
<xsl:import href="../../common/ihtml/xslt/mxml_to_ihtml.xsl"/>
<xsl:variable name="style" select="'normal-style'"/>     
<xsl:variable name="folder-max-size" select="0"/>

<!-- *******************************************************************
			BOOK SPECIFIC FORMATING
     ******************************************************************* -->
     
<!-- *******************************************************************
			Breadcrumbs
     ******************************************************************* -->
     
      
<xsl:template name="getPageColor">
	<xsl:choose>
		<xsl:when test="child::title[@class='chapter-foreground-purple'] or ancestor::container/title[@class='chapter-foreground-purple']">
			<xsl:attribute name="color">
				<xsl:value-of select="'purple'"/>
			</xsl:attribute>
		</xsl:when>
	
		<xsl:when test="child::title[@class='chapter-foreground-lblue'] or ancestor::container/title[@class='chapter-foreground-lblue']">
			<xsl:attribute name="color">
				<xsl:value-of select="'lblue'"/>
			</xsl:attribute>
		</xsl:when>
		<xsl:when test="child::title[@class='chapter-foreground-red'] or ancestor::container/title[@class='chapter-foreground-red']">
			<xsl:attribute name="color">
				<xsl:value-of select="'red'"/>
			</xsl:attribute>
		</xsl:when>
		<xsl:when test="child::title[@class='chapter-foreground-olive'] or ancestor::container/title[@class='chapter-foreground-olive']">
			<xsl:attribute name="color">
				<xsl:value-of select="'olive'"/>
			</xsl:attribute>
		</xsl:when>
		<xsl:when test="child::title[@class='chapter-foreground-yellow'] or ancestor::container/title[@class='chapter-foreground-yellow']">
			<xsl:attribute name="color">
				<xsl:value-of select="'yellow'"/>
			</xsl:attribute>
		</xsl:when>
		
	</xsl:choose>
</xsl:template> 
<xsl:template name="getSearchClassBreadcrumb">
	<xsl:choose>
	<xsl:when test="following-sibling::table">
		<xsl:value-of select="normalize-space(ancestor::container[parent::book]/title)"/>
	</xsl:when>
	<xsl:when test="starts-with(parent::container/@pres-type,'none')">
		<xsl:value-of select="normalize-space(parent::container/title)"/> - <xsl:value-of select="normalize-space(ancestor::container[parent::book]/title)"/>
	</xsl:when>
	<xsl:otherwise>
		<xsl:value-of select="normalize-space(ancestor::container[parent::book]/title)"/>
	</xsl:otherwise>
	</xsl:choose>
	
</xsl:template>

<xsl:template name="getSearchKeywordBreadcrumb">
	<xsl:value-of select="normalize-space(ancestor::container[parent::book]/title)"/>
</xsl:template>

<xsl:template name="getSectionBreadcrumb">
	<xsl:value-of select="normalize-space(ancestor::container[parent::book/container]/title)"/>	
</xsl:template>

<xsl:template name="getTableBreadcrumb">
	<xsl:value-of select="normalize-space(ancestor::container[parent::book]/title)"/>
</xsl:template>

<xsl:template name="getVideoBreadcrumb">
</xsl:template>

<!-- image breadcrumbs, used in html header and and describes enviroment for a image bookmark&history entry  -->  
<xsl:template name="getImageBreadcrumb">
	<xsl:value-of select="normalize-space(ancestor::container[parent::book]/title)"/>
</xsl:template>
<xsl:variable name="link-video-repo" select="''"/>
<xsl:template name="getVideoBreadcrumb">
</xsl:template>
<!-- Linear Reading -->
<xsl:template match="td[(normalize-space(.) = 'Next')]">
  <td align="right">
    <xsl:apply-templates/>
  </td>
</xsl:template>
</xsl:stylesheet>
