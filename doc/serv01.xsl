<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version="1.0">
<xsl:output method="text" encoding="UTF-8" />

<xsl:template match="/">
  <xsl:text>Liste des services</xsl:text>
  <xsl:apply-templates />
</xsl:template>

</xsl:stylesheet>