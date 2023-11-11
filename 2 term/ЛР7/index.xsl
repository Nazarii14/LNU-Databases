<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/socialnetwork">
    <html>
      <head>
        <title>Person Information</title>
        <style>
          .odd-row { background-color: #f2f2f2; }
          .even-row { background-color: #ffffff; }
        </style>
      </head>
      <body>
        <h1>People Information</h1>
        <table border="1">
          <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Birthdate</th>
            <th>Address</th>
            <th>Workplace</th>
          </tr>
          <xsl:for-each select="person">
            <xsl:sort select="number(id)" data-type="number" order="ascending"/>
            <xsl:variable name="rowClass">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 1">odd-row</xsl:when>
                <xsl:otherwise>even-row</xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <tr class="{$rowClass}">
              <td><xsl:value-of select="id"/></td>
              <td><xsl:value-of select="firstname"/></td>
              <td><xsl:value-of select="lastname"/></td>
              <td><xsl:value-of select="birthdate"/></td>
              <td><xsl:value-of select="address"/></td>
              <td>
                <xsl:for-each select="workplace">
                  <xsl:value-of select="company"/>
                  <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>


