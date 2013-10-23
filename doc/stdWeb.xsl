<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version="1.0">
<xsl:output method="xml" encoding="ISO-8859-1"/>

<!-- ceci est le fichier stdWeb.xsl  -->

<!-- il contient des sous-programmes pour faciliter les transformations  -->
<!-- XSL qui produisent des pages XHTML valides au sens 1.0 Strict       -->

<!-- ####################################################################################################### -->
<!-- #                                                                                                     # -->
<!-- #   saut de ligne simple                                                                              # -->
<!-- #                                                                                                     # -->
<!-- ####################################################################################################### -->

<xsl:template name="sdl">
<xsl:text>
</xsl:text>
</xsl:template>

<!-- ####################################################################################################### -->
<!-- #                                                                                                     # -->
<!-- #   saut de ligne puis n espaces                                                                      # -->
<!-- #                                                                                                     # -->
<!-- ####################################################################################################### -->

<xsl:template name="sdletsp">
<xsl:param name="espaces" />
<xsl:text>
</xsl:text>
<xsl:if test="$espaces=3"><xsl:text>   </xsl:text></xsl:if>
<xsl:if test="$espaces=5"><xsl:text>     </xsl:text></xsl:if>
</xsl:template>

<!-- ####################################################################################################### -->
<!-- #                                                                                                     # -->
<!-- #   début de page XHTML                                                                               # -->
<!-- #                                                                                                     # -->
<!-- ####################################################################################################### -->

<xsl:template name="debutPage">

   <xsl:param name="leTitre" />

   <xsl:value-of select="'&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Strict//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd&quot;&gt;'"
                                           disable-output-escaping="yes" />    <xsl:call-template name="sdl" />
   <xsl:value-of select="'&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot; lang=&quot;fr&quot; xml:lang=&quot;fr&quot;&gt;'"
                                             disable-output-escaping="yes" />    <xsl:call-template name="sdl" />
   <head>                                                                        <xsl:call-template name="sdl" />
     <meta http-equiv="Content-type" content="text/html; charset=iso-8859-1"/>   <xsl:call-template name="sdl" />
     <link  rel="stylesheet" type="text/css" href="std.css" title="gh"/>         <xsl:call-template name="sdl" />
     <title><xsl:value-of select="$leTitre" /></title>                           <xsl:call-template name="sdl" />
   </head>                                                                       <xsl:call-template name="sdl" />

   <xsl:value-of select="'&lt;body class=&quot;beige_jpg&quot;&gt;'"     disable-output-escaping="yes" />    <xsl:call-template name="sdl" />

   <h1><xsl:value-of select="$leTitre" /></h1><xsl:call-template name="sdl" />
</xsl:template>

<!-- ####################################################################################################### -->
<!-- #                                                                                                     # -->
<!-- #   fin de page XHTML                                                                                 # -->
<!-- #                                                                                                     # -->
<!-- ####################################################################################################### -->

<xsl:template name="finPage">
   <xsl:value-of select="'&lt;/body&gt;'" disable-output-escaping="yes" />    <xsl:call-template name="sdl" />
   <xsl:value-of select="'&lt;/html&gt;'" disable-output-escaping="yes" />    <xsl:call-template name="sdl" />
</xsl:template>

<!-- ####################################################################################################### -->
<!-- #                                                                                                     # -->
<!-- #   début de tableau XHTML                                                                            # -->
<!-- #                                                                                                     # -->
<!-- ####################################################################################################### -->

<xsl:template name="debutTableau">
   <xsl:value-of select="'&lt;table border=&quot;1&quot; class=&quot;bgcolor_white collapse&quot; cellpadding=&quot;20&quot; cellspacing=&quot;5&quot;&gt;'"
                 disable-output-escaping="yes"
   />
   <xsl:call-template name="sdl" />
</xsl:template>

<!-- ####################################################################################################### -->
<!-- #                                                                                                     # -->
<!-- #   fin de tableau XHTML                                                                              # -->
<!-- #                                                                                                     # -->
<!-- ####################################################################################################### -->

<xsl:template name="finTableau">
   <xsl:value-of select="'&lt;/table&gt;'" disable-output-escaping="yes" />
   <xsl:call-template name="sdl" />
</xsl:template>

</xsl:stylesheet>
