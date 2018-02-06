<?xml version="1.0"?>
<xsl:stylesheet xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="m" version="1.0">

<!--
	 *
	 * Copyright (c) 2005+ MedHand International AB
	 * All rights reserved.
	 *
	 ***************************************************************
	 *
	 * @(#)wabcpp_to_mxml.xsl
   *
   * DESCRIPTION:
   * ======================
   * Stylesheet for converting  dth XML to MedHand XML(MXML). 
   *
   * CHANGES:
   * ======================
	 -->


<!-- PRE-DEFINED FUNCTION TEMPLATES -->

<xsl:template name="getPreviousAttributes">
	<xsl:choose>
		<xsl:when test="@*">
			<xsl:for-each select="@*">
				<xsl:text> </xsl:text><xsl:value-of select="name()"/>=<xsl:text>"</xsl:text><xsl:value-of select="."/><xsl:text>"</xsl:text>
			</xsl:for-each>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text></xsl:text>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="*" mode="serialise">
  <xsl:text>&lt;</xsl:text>
  <xsl:value-of select="name()" />
  <xsl:for-each select="@*">
    <xsl:text> </xsl:text>
    <xsl:value-of select="name()" />
    <xsl:text>="</xsl:text>
    <xsl:value-of select="." />
    <xsl:text>"</xsl:text>
  </xsl:for-each>
  <xsl:text>></xsl:text>
  <xsl:apply-templates select="node()" mode="serialise" />
  <xsl:text>&lt;/</xsl:text>
  <xsl:value-of select="name()" />
  <xsl:text>></xsl:text>
</xsl:template>

<!-- PRE-DEFINED FUNCTION TEMPLATES *END*-->

<!-- variable flag for moving misplaced process instructions or not -->
<xsl:variable name="move_pi" select="'1'"/>

<!-- book id variable -->
<xsl:variable name="book-id"><xsl:value-of select="/book/@id"/></xsl:variable>

<!-- function returning box background color -->
<xsl:template name="getBoxBackgroundColor">
	<xsl:param name="chapter-id"/>
	<xsl:attribute name="class">
		<xsl:text>outline-box-background-color</xsl:text>
	</xsl:attribute>
</xsl:template>

<!-- function returning section title color -->
<xsl:template name="getSectionTitleColor">
	<xsl:attribute name="class">
		<xsl:text>section-foreground-color</xsl:text>
	</xsl:attribute>
</xsl:template>

<!-- function returning part title color -->
<xsl:template name="getPartTitleColor">
	<xsl:attribute name="class">
		<xsl:text>part-foreground-color</xsl:text>
	</xsl:attribute>
</xsl:template>

<!-- function returning chapter title color -->
<xsl:template name="getChapterTitleColor">
	<xsl:attribute name="class">
		<xsl:text>chapter-foreground-color</xsl:text>
	</xsl:attribute>
</xsl:template>

<!-- function returning div1 title color -->
<xsl:template name="getDiv1TitleColor">
	<xsl:attribute name="class">
		<xsl:text>div1-foreground-color</xsl:text>
	</xsl:attribute>
</xsl:template>

<!-- function returning div2 title color -->
<xsl:template name="getDiv2TitleColor">
	<xsl:attribute name="class">
		<xsl:text>div2-foreground-color</xsl:text>
	</xsl:attribute>
</xsl:template>

<!-- function returning div3 title color -->
<xsl:template name="getDiv3TitleColor">
	<xsl:attribute name="class">
		<xsl:text>div3-foreground-color</xsl:text>
	</xsl:attribute>
</xsl:template>

<!-- function returning div4 title color -->
<xsl:template name="getDiv4TitleColor">
	<xsl:attribute name="class">
		<xsl:text>div4-foreground-color</xsl:text>
	</xsl:attribute>
</xsl:template>

<!-- function returning div5 title color -->
<xsl:template name="getDiv5TitleColor">
	<xsl:attribute name="class">
		<xsl:text>div5-foreground-color</xsl:text>
	</xsl:attribute>
</xsl:template>

<!-- function returning text formatting -->
<xsl:template name="getFormatedText">
	<em>
		<xsl:attribute name="class">
				<xsl:text>text-foreground-color</xsl:text>
		</xsl:attribute>
		<xsl:choose>
			<xsl:when test="ancestor::note"> 
				<b>
					<xsl:apply-templates/>
				</b>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</em>
</xsl:template>

<!-- MANIFEST ELEMENTS TEMPLATES -->
<xsl:template match="manifest">
	<book pres-type="hard">
		<title><xsl:value-of select="@title"/></title>
		<img type="frontpage" src="frontpage.bmp"/> 
		<xsl:apply-templates/>
	</book>
</xsl:template>

<xsl:template match="manifest-file">
	<container pres-type="hard" >
		<title search-class="title"><xsl:value-of select="@title"/></title>
		<xsl:apply-templates select="document(@src)"/>
	</container>
</xsl:template>



<xsl:template match="part">
<container pres-type="hard" > 
	<title><xsl:value-of select="@title"/></title>
	<xsl:apply-templates/>
</container>
</xsl:template>
<!-- USER-DEFINED ELEMENTS TEMPLATES -->



<!-- USER-DEFINED ELEMENTS TEMPLATES *END*-->

<!-- UNDEFINED ELEMENT TEMPLATES -->

<!-- This is were a unndefined element ends up. -->
<xsl:template match="*">
	[%WARNING% message=No stylesheet entry for: <xsl:value-of select="name()"/>]
</xsl:template>

<!-- UNDEFINED ELEMENT TEMPLATES *END*-->

</xsl:stylesheet>

