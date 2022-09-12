<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <html lang="IT">
            <head>
                <title><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']"/></title>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link rel="stylesheet" href="assets/css/normalize.css" />
                <link rel="stylesheet" href="assets/css/style.css" />
                <link rel="preconnect" href="https://fonts.googleapis.com" />
                <link rel="preconnect" href="https://fonts.gstatic.com" />
                <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700" rel="stylesheet" />
                <script src="assets/js/main.js"></script>
            </head>
            <body>
                <header class="header">
                    <!-- Menu -->
                    <div class="header-wrapper wrapper">
                        <ul class="header-menu">
                            <li> <a class="scroll-to" title="Descrizione" href="#descrizione-fisica">Descrizione</a> </li>
                            <li> <a class="scroll-to" title="Pagina 2" href="#pagina-2">Pagina 2</a> </li>
                            <li> <a class="scroll-to" title="Pagina 3" href="#pagina-3"> Pagina 3</a></li>
                            <li> <a class="scroll-to" title="Glossario" href="#glossario">Glossario</a> </li>
                            <li> <a class="scroll-to" title="Bibliografia" href="#bibliografia">Bibliografia</a> </li>
                        </ul>
                    </div>
                </header>

                <main id="main">
                    <!-- Schermata iniziale -->
                    <section id="Home" class="section section-1">
                        <img class="section-bg" alt="De Saussure" src="assets/img/section1_bg.jpg" />
                        <div class="section-wrapper wrapper">
                            <div class="section-info">
                                <h3 class="eyelet"> Progetto universitario: codifica testuale di due pagine estratte da </h3>
                                <br/>
                                <h1 class="main-title"> <em><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']"/></em></h1>
                                <br/>
                                <h4>di <xsl:value-of select="//tei:teiHeader/tei:fileDesc//tei:msContents//tei:author"/></h4>
                            </div>
                        </div>
                        <div class="section-scroll-icon">
                            <a class="scroll-to" title="Informazioni sul progetto" href="#informazioni-sul-progetto"></a>
                            <span class="left-bar"></span>
                            <span class="right-bar"></span>
                        </div>
                    </section>

                    <!-- Informazioni sul progetto -->
                    <section id="informazioni-sul-progetto" class="section section-2">
                        <div class="wrapper section-wrapper">
                            <h2 class="section-title">Informazioni sul progetto</h2>
                            <p>Il progetto è stato realizzato da Arianna Tescari per l'esame di Codifica di Testi, previsto dal corso di laurea triennale in Informatica Umanistica, nell'anno accademico 2021-2022.</p>
                            <p>Il lavoro ha previsto la codifica di due pagine, comprese nelle <em>Prolusioni 3</em>, una parte della raccolta di appunti <em>Trois premières conférences à l'Université</em>, corrispondente alla terza conferenza all'Università di Ginevra, svoltasi il 13/11/1891 o il 17/11/1891.</p>
                            <br/>
                        </div>
                    </section>

                    <!-- Informazioni sulla fonte -->
                    <section id="informazioni-sulla-fonte" class="section section-3">
                        <div class="wrapper section-wrapper">
                            <h2 class="section-title">Informazioni sulla fonte</h2>
                            <xsl:apply-templates select="//tei:teiHeader/tei:fileDesc//tei:msContents"/>
                        </div>
                    </section>

                    <!-- Descrizione fisica -->
                    <section id="descrizione-fisica" class="section section-3">
                        <div class="wrapper section-wrapper">
                            <h2 class="section-title">Descrizione fisica</h2>
                            <xsl:apply-templates select="//tei:teiHeader/tei:fileDesc//tei:physDesc"/>
                        </div>
                    </section>

                    <!-- Pagine analizzate + carousel-->
                    <section id="pagine" class="carousel">
                        <div class="carousel-wrapper wrapper">
                            <h2 class="carousel-title">Pagine analizzate</h2>
                            <div class="carousel-container">
                                <div class="carousel-slides">
                                    <xsl:apply-templates select="//tei:facsimile" />
                                </div>
                                <button class="carousel-arrow carousel-arrow-prev">
                                    <svg width="40" height="60" xmlns="http://www.w3.org/2000/svg" version="1.1">
                                        <polyline points="30 10 10 30 30 50" stroke="rgba(255,255,255,0.5)" stroke-width="4" stroke-linecap="butt" fill="none" stroke-linejoin="round">&gt;</polyline>
                                    </svg>
                                </button>
                                <button class="carousel-arrow carousel-arrow-next">
                                    <svg width="40" height="60" xmlns="http://www.w3.org/2000/svg" version="1.1">
                                        <polyline points="10 10 30 30 10 50" stroke="rgba(255,255,255,0.5)" stroke-width="4" stroke-linecap="butt" fill="none" stroke-linejoin="round">&lt;</polyline>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </section>

                    <!-- Marker attivazione pulsantiera-->
                    <div class="page-content-filters-trigger"></div>

                    <!-- Pulsantiera-->
                    <div class="page-content-filters">
                        <div class="text-center">
                            <ul>
                                <li>
                                    <button data-filter-tag="del" type="button" class="legend-filter tag-del">
                                        <span class="legend-indicator"></span>
                                        <span class="legend-label">Cancellature</span>
                                    </button>
                                </li>
                                <li>
                                    <button data-filter-tag="sic" type="button" class="legend-filter tag-cor">
                                        <span class="legend-indicator"></span>
                                        <span class="legend-label">Correzioni</span>
                                    </button>
                                </li>
                                <li>
                                    <button data-filter-tag="abbr" type="button" class="legend-filter tag-abbr">
                                        <span class="legend-indicator"></span>
                                        <span class="legend-label">Abbreviazioni</span>
                                    </button>
                                </li>
                                <li>
                                    <button data-filter-tag="term" type="button" class="legend-filter tag-term">
                                        <span class="legend-indicator"></span>
                                        <span class="legend-label">Termini</span>
                                    </button>
                                </li>
                                <li>
                                    <button data-filter-tag="add" type="button" class="legend-filter tag-notes">
                                        <span class="legend-indicator"></span>
                                        <span class="legend-label">Aggiunte</span>
                                    </button>
                                </li>
                                <li>
                                    <button data-filter-tag="lang" type="button" class="legend-filter tag-glot">
                                        <span class="legend-indicator"></span>
                                        <span class="legend-label">Glottonimi</span>
                                    </button>
                                </li>
                                <li>
                                    <button data-filter-tag="reg" type="button" class="legend-filter tag-reg">
                                        <span class="legend-indicator"></span>
                                        <span class="legend-label">Regolarizzazioni</span>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- Pagina 2 -->
                    <section id="pagina-2" class="section section-4">
                        <div class="wrapper section-wrapper">
                            <h2 class="pagina-1-title section-title">Pagina 2</h2>
                            <div class="section-grid-2">
                                <div class="section-grid-row">
                                    <div class="col col-1 text-left">
                                        <h3 class="trans">Trascrizione</h3>
                                    </div>
                                    <div class="col col-2 text-left">
                                        <h3 class="trans">Traduzione</h3>
                                    </div>
                                </div>
                                <div class="section-grid-row">
                                    <div class="col col-1">
                                        <div class="analyzed-text">
                                            <xsl:apply-templates select="//tei:text//tei:div[@xml:id='div_pag2']" />
                                        </div>
                                    </div>
                                    <div class="col col-2">
                                        <div class="translated-text">
                                            <xsl:apply-templates select="//tei:text[@xml:id='it_prolusioni3-pag2']" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Pagina 3 -->
                    <section id="pagina-3" class="section section-4">
                        <div class="wrapper section-wrapper">
                            <h2 class="pagina-1-title section-title">Pagina 3</h2>
                            <div class="section-grid-2">
                                <div class="section-grid-row">
                                    <div class="col col-1 text-left">
                                        <h3 class="trans">Trascrizione</h3>
                                    </div>
                                    <div class="col col-2 text-left">
                                        <h3 class="trans">Traduzione</h3>
                                    </div>
                                </div>
                                <div class="section-grid-row">
                                    <div class="col col-1">
                                        <div class="analyzed-text">
                                            <xsl:apply-templates select="//tei:text//tei:div[@xml:id='div_pag3']" />
                                        </div>
                                    </div>
                                    <div class="col col-2">
                                        <div class="translated-text">
                                            <xsl:apply-templates select="//tei:text[@xml:id='it_prolusioni3-pag3']" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Marker disattivazione pulsantiera-->
                    <div class="page-content-filters-trigger-remove"></div>

                    <!-- Glossario -->
                    <section id="glossario" class="section section-6">
                        <div class="wrapper section-wrapper">
                            <h2 class="section-title">Glossario</h2>
                            <div class="glossary">
                                <xsl:apply-templates select="//tei:list[@type='terminology']" />
                            </div>
                        </div>
                    </section>

                    <!-- Bibliografia -->
                    <section id="bibliografia" class="section section-7">
                        <div class="wrapper section-wrapper">
                            <h2 class="section-title">Bibliografia</h2>
                            <div class="bibliography">
                                <xsl:apply-templates select="//tei:back//tei:listBibl" />
                            </div>
                        </div>
                    </section>

                </main>

                <!-- Footer -->
                <footer class="footer">
                    <div class="footer-wrapper">
                        <ul>
                            <li><xsl:value-of select="//tei:editionStmt/tei:edition"/></li>
                        </ul>
                        <ul class="detail-list">
                            <xsl:for-each select="//tei:editionStmt/tei:respStmt">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </footer>

            </body>
        </html>
    </xsl:template>

    <!-- Lista template per visualizzare i contenuti dell'header -->

    <!-- Template Informazioni sulla fonte -->
    <xsl:template match="//tei:teiHeader/tei:fileDesc//tei:msContents">
        <div class="detail-list-container">
            <table class="detail-list">
                <tr class="detail-list-row">
                    <td class="detail-list-name">
                        <span>Autore</span>
                    </td>
                    <td class="detail-list-value">
                        <span><xsl:value-of select="tei:msItem/tei:author"/></span>
                    </td>
                </tr>
                <tr class="detail-list-row">
                    <td class="detail-list-name">
                        <span>Titolo</span>
                    </td>
                    <td class="detail-list-value">
                        <span><xsl:value-of select="tei:msItem/tei:title"/></span>
                    </td>
                </tr>
                <tr class="detail-list-row">
                    <td class="detail-list-name">
                        <span>Manoscritto</span>
                    </td>
                    <td class="detail-list-value">
                        <span><xsl:value-of select="../tei:msIdentifier/tei:idno[@type='inventory']"/></span>
                    </td>
                </tr>
                <tr class="detail-list-row">
                    <td class="detail-list-name">
                        <span>Storia</span>
                    </td>
                    <td class="detail-list-value">
                        <p><xsl:value-of select="../tei:history/tei:origin/tei:p"/></p>
                    </td>
                </tr>
                <tr class="detail-list-row">
                    <td class="detail-list-name">
                        <span>Lingua</span>
                    </td>
                    <td class="detail-list-value">
                        <span><xsl:value-of select="tei:msItem/tei:textLang"/></span>
                    </td>
                </tr>
                <tr class="detail-list-row">
                    <td class="detail-list-name">
                        <span>Data</span>
                    </td>
                    <td class="detail-list-value">
                        <span><xsl:value-of select="tei:msItem/tei:docDate"/></span>
                    </td>
                </tr>
                <tr class="detail-list-row">
                    <td class="detail-list-name">
                        <span>Luogo di conservazione</span>
                    </td>
                    <td class="detail-list-value">
                        <span><xsl:value-of select="../tei:msIdentifier/tei:repository"/></span>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <!-- Template descrizione fisica -->
    <xsl:template match="//tei:teiHeader/tei:fileDesc//tei:physDesc">
        <div class="detail-list-container">
            <table class="detail-list">
                <tr class="detail-list-row">
                    <td class="detail-list-name">
                        <span>Supporto</span>
                    </td>
                    <td class="detail-list-value">
                        <span><xsl:value-of select="//tei:material"/></span>
                    </td>
                </tr>
                <tr class="detail-list-row">
                    <td class="detail-list-name">
                        <span>Quantità</span>
                    </td>
                    <td class="detail-list-value">
                        <xsl:value-of select="tei:objectDesc//tei:measureGrp/tei:measure[last()]"/>
                    </td>
                </tr>
                <tr class="detail-list-row">
                    <td class="detail-list-name">
                        <span>Condizioni</span>
                    </td>
                    <td class="detail-list-value">
                        <span><xsl:value-of select="//tei:condition"/></span>
                    </td>
                </tr>
                <tr class="detail-list-row">
                    <td class="detail-list-name">
                        <span>Mani</span>
                    </td>
                    <td class="detail-list-value">
                        <span><xsl:value-of select="//tei:handDesc"/></span>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <!-- Template slider immagini e imagemap -->
    <xsl:template match="tei:facsimile">
        <xsl:for-each select="//tei:surface">
            <!-- slider che ospita le immagini relative alle pagine -->
            <div class="carousel-slide">
                <xsl:element name="img">
                    <xsl:attribute name="class">carousel-img</xsl:attribute>
                    <xsl:attribute name="src">img/<xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
                    <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id"/></xsl:attribute>
                    <xsl:attribute name="alt"><xsl:value-of select="@xml:id"/></xsl:attribute>
                </xsl:element>
                <xsl:element name="map">
                    <xsl:attribute name="name"><xsl:value-of select="@xml:id" /></xsl:attribute>
                    <!-- Ottengo il valore "width" di ciascun tag <graphic> e rimuovo px alla fine in modo da poter calcolare il ratio --> 
                    <xsl:variable name="width">
                    <xsl:value-of select="concat(substring-before(tei:graphic/@width, 'px'), '')"/>
                    </xsl:variable>          
                    <!-- Calcolo il rapporto tra la larghezza dell'immagine e quella del contenitore che la ospiterà -->
                    <xsl:variable name="ratio" select="500 div $width"/>
                    <!-- Per ogni <zone> che riguarda una riga stampo un tag <area> e le corrispettive coordinate in modo da rendere l'immagine cliccabile -->
                    <xsl:for-each select="tei:zone[@rendition='line']">
                        <xsl:element name="area">
                            <xsl:attribute name="shape">rect</xsl:attribute>
                            <!-- Unisco i valori degli attributi ulx, uly, lrx, lry affinchè siano "compatibili" con l'attributo coords del tag <area> -->
                            <xsl:attribute name="coords">
                                <xsl:value-of select="concat(@ulx*$ratio, ',', @uly*$ratio, ',', @lrx*$ratio, ',', @lry*$ratio)"/>
                            </xsl:attribute>
                            <xsl:attribute name="id">
                                <xsl:value-of select="@xml:id"/>_area
                            </xsl:attribute>
                            <!-- Creo un href contenente l'xml:id che verrà poi usato per navigare le righe quando si clicca su una di queste -->
                            <xsl:attribute name="href">#<xsl:value-of select="@xml:id"/>_line</xsl:attribute>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </div>
        </xsl:for-each>
    </xsl:template>

    <!-- Lista Template per renderizzare HTML personalizzato a seconda del tag utilizzato nella codifica -->
    
    <!-- Pericope -->
    <xsl:template match="tei:ab">
        <xsl:element name="h4">
            <xsl:attribute name="class">pericope</xsl:attribute>
            Pericope <xsl:value-of select="@n" />
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Righe -->
    <xsl:template match="tei:lb">
        <xsl:element name="br"></xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="class">row-number</xsl:attribute>
            <xsl:value-of select="@n" />
        </xsl:element>
    </xsl:template>

    <!-- Correzioni -->
    <xsl:template match="tei:choice/tei:sic">
        <xsl:element name="span">
            <xsl:attribute name="class">sic</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Abbreviazione -->
    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- Testo originale -->
    <xsl:template match="tei:orig">
        <xsl:element name="span">
            <xsl:attribute name="class">orig</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- Tag expan --> 
    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Tag reg -->
    <xsl:template match="tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Aggiunte dell'autore o editoriali -->
    <xsl:template match="tei:add | tei:supplied">
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Cancellature -->
    <xsl:template match="tei:del">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Elementi non leggibili -->
    <xsl:template match="tei:gap">
        <xsl:element name="span">
            <xsl:attribute name="class">gap</xsl:attribute>
            ?
        </xsl:element>
    </xsl:template>

    <!-- Terminologia -->
    <xsl:template match="tei:term">
        <xsl:element name="span">
            <xsl:attribute name="class">term</xsl:attribute>
            <xsl:element name="a">
                <xsl:attribute name="class">scroll-to</xsl:attribute>
                <xsl:attribute name="href"><xsl:value-of select="@ref"/></xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- Glottonimi -->
    <xsl:template match="tei:lang">
        <xsl:element name="span">
            <xsl:attribute name="class">lang</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <!-- Enfasi -->
    <xsl:template match="tei:emph">
        <xsl:element name="span">
            <xsl:attribute name="class">emph</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- Evidenziato italico -->
    <xsl:template match="tei:hi[@rend='italic']">
        <xsl:element name="span">
            <xsl:element name="i">
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- Glossario -->
    <xsl:template match="tei:list[@type='terminology']">
        <xsl:for-each select="tei:label">
            <xsl:element name="div">
                <xsl:attribute name="class">glossary-entry</xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="tei:term/@xml:id"/></xsl:attribute>
                <xsl:element name="h4">
                <xsl:attribute name="class">glossary-term</xsl:attribute>
                <xsl:value-of select="."/>
                </xsl:element>
                <p class="glossary-description">
                    <xsl:variable name="currentTermID">
                        <xsl:value-of select="concat('#',tei:term/@xml:id)"/>
                    </xsl:variable>
                    <xsl:for-each select="../tei:item/tei:gloss">
                        <xsl:if test="$currentTermID = @target">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </p>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <!-- Bibliografia -->
    <xsl:template match="tei:listBibl">
        <xsl:element name="ul">
            <xsl:for-each select="tei:bibl">
                    <xsl:element name="li">
                        <xsl:element name="a">
                            <xsl:attribute name="href"><xsl:value-of select="@source"/></xsl:attribute>
                            
                            <xsl:element name="span">
                                <xsl:attribute name="class">underline</xsl:attribute>
                                <xsl:value-of select="tei:title"/>
                            </xsl:element>
                            ,
                            <xsl:for-each select="tei:author/tei:persName">
                                <i><xsl:value-of select="." /></i>,
                            </xsl:for-each>
                            <xsl:for-each select="tei:pubPlace/tei:placeName">
                                <xsl:value-of select="."/>,
                            </xsl:for-each>
                            <xsl:value-of select="tei:publisher"/>,
                            <xsl:value-of select="tei:date"/>
                        </xsl:element>
                    </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
