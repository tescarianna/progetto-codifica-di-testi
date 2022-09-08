## Progetto di codifica di testi - Arianna Tescari (2021/2022)

Il progetto è stato realizzato da Arianna Tescari per l'esame di codifica di testi, previsto dal corso di laurea triennale in Informatica Umanistica, nell'anno accademico 2021-2022.
Il lavoro ha previsto la codifica di due pagine estratte dalla raccolta Trois premières conférences à l'Université (codice archivistico BGE Ms. fr. 3951/1.3), di Ferdinand de Saussure.

L'xml alla base del progetto è stato validato utilizzando Xerces, mentre per la generazione dell'output xsl->html è stato usato Saxon.
Di seguito sono presenti i comandi per validare e compilare il progetto:

## Validazione XML tramite Xerces

```shell
$ java -cp "_tools/xerces/xml-apis.jar;_tools/xerces/xercesImpl.jar;_tools/xerces/xercesSamples.jar" dom.Counter src/prolusioni_3.xml
```

## Generazione output HTML a partire da .xsl tramite Saxon

```shell
$ java -jar _tools/saxon/saxon-he-11.4.jar -s:src/prolusioni_3.xml -xsl:src/index.xsl -o:src/index.html
```