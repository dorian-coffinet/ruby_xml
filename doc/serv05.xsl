<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version="1.0">
<xsl:import href="./doc/stdWeb.xsl" />
<xsl:output method="text" encoding="UTF-8" />
<xsl:strip-space elements="services" />

<xsl:template match="/">

  <xsl:text>Liste des services</xsl:text>
  <xsl:call-template name="sdl" />

  <xsl:for-each select="//service">
     <xsl:text>  </xsl:text>
     <xsl:value-of select="position()" />
     <xsl:text> - </xsl:text>
     <xsl:value-of select="normalize-space( text())" />
     <xsl:call-template name="sdl" />
  </xsl:for-each>

</xsl:template>

</xsl:stylesheet>