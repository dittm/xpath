<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <xsl:output method="xhtml" indent="yes" html-version="5" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="//titleStmt/title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="letter-schuchardt.css"/>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                    rel="stylesheet"/>
            </head>
            <body>
                <section class="container">
                    <header>
                        <h1>
                            <xsl:call-template name="series"/>
                        </h1>
                    </header>
                    <main>
                        <h2>
                            <xsl:call-template name="title"/>
                        </h2>
                        <section class="info">
                            <xsl:call-template name="desc"/>
                        </section>
                        <section>
                            <xsl:apply-templates select="//text"/>
                        </section>
                    </main>
                </section>
                <footer class="footer mt-auto py-3 bg-dark">
                    <section class="container">
                        <xsl:call-template name="footer"/>
                    </section>
                </footer>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="series">
        <xsl:apply-templates select="//sourceDesc/bibl/series/title"/>
    </xsl:template>

    <xsl:template name="title">
        <xsl:apply-templates select="//titleStmt/title"/>
    </xsl:template>

    <xsl:template name="desc">
        <p>
            <xsl:text>Verfasser: </xsl:text>
            <xsl:apply-templates select="//correspAction[@type = 'sent']/persName"/>
            <br/>
            <xsl:text>Ort: </xsl:text>
            <xsl:apply-templates select="//correspAction[@type = 'sent']/placeName"/>
            <br/>
            <xsl:text>Datum: </xsl:text>
            <xsl:apply-templates select="//correspAction[@type = 'sent']/date"/>
            <br/>
            <xsl:text>Empfänger: </xsl:text>
            <xsl:apply-templates select="//correspAction[@type = 'received']/persName"/>
        </p>
    </xsl:template>

    <xsl:template match="dateline">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>

    <xsl:template match="opener | salute | signed | p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="persName">
        <strong>
            <xsl:apply-templates/>
        </strong>
    </xsl:template>

    <xsl:template name="footer">
        <p>
            <xsl:for-each
                select="//publicationStmt/*[self::publisher | self::authority | self::distributor]/orgName">
                <xsl:apply-templates/>
                <br/>
            </xsl:for-each>
        </p>
    </xsl:template>

</xsl:stylesheet>
