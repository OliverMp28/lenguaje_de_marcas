<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <html lang="en">
            <head>
                <meta charset="UTF-8"></meta>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>

                <style>
                    h1{
                        font-size: 250%;
                    }
                    .titulo{
                        width: 100%;
                        text-align: center;
                    }
                    .nombre{
                    font-weight: bold;
                    }
                    th{
                        background-color: rgb(20, 96, 97);
                        color: aliceblue;
                        border-radius: 4px 4px 0 0;
                        padding: 5px;
                        height: 20px;
                    }
                    td{
                        background-color: rgb(177, 216, 225);
                        padding: 4px;
                    }
                    .rojo{
                        font-weight: bold;
                        color: red;
                    }
                    .verde{
                        font-weight: bold;
                        color: rgb(25, 108, 0);
                    }
                    .tabla{
                        width: 90%;
                        margin: 0 auto;
                    }
                </style>
            </head>
            <body>
                <h1 class="titulo">Historial de libros</h1>
                <table class="tabla">
    
                    <!-- <xsl:for-each select="CATALOGO/DISCO">-->
                    <tr>
                        <th>Titulo</th>
                        <th>Autor</th>
                        <th>Anio publicacion</th>
                        <th>Genero</th>
                        <th>Paginas</th>
                        <th>Editorial</th>
                        <th>Precio</th>
                        <th>Valoracion</th>
                    </tr>
                    <xsl:for-each select="libros/libro">
       
                    <!--    <xsl:choose>
                            <xsl:when test="autor=Jane Austen">
                                <xsl:variable name="color" select="'verde'"></xsl:variable>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="color" select="'rojo'"></xsl:variable>
                            </xsl:otherwise>
                        </xsl:choose> -->


                            <xsl:variable name="color">
                                <xsl:choose>
                                    <xsl:when test="valoracion > 4.4">
                                        verde
                                    </xsl:when>
                                    <xsl:otherwise>
                                        rojo
                                    </xsl:otherwise>
                                </xsl:choose> 
                            </xsl:variable>

                            <xsl:variable name="genero">
                                <xsl:choose>
                                    <xsl:when test="genero = 'Ficción'">
                                        background-color: rgb(116, 146, 245);
                                    </xsl:when >
                                    <xsl:when test="genero = 'Ficción distópica'">
                                        background-color: rgb(65, 144, 217);
                                    </xsl:when >
                                    <xsl:when test="genero = 'Literatura infantil'">
                                        background-color: rgb(76, 174, 234);
                                    </xsl:when >
                                    <xsl:when test="genero = 'Fantasía'">
                                        background-color: rgb(113, 197, 239);
                                    </xsl:when >
                                    <xsl:when test="genero = 'Ficción histórica'">
                                        background-color: rgb(137, 224, 243);
                                    </xsl:when >
                                    <xsl:when test="genero = 'Ficción espiritual'">
                                        background-color: rgb(198, 249, 252);
                                    </xsl:when >
                                    <xsl:when test="genero = 'Ciencia ficción'">
                                        background-color: rgb(225, 247, 255);
                                    </xsl:when >
                                
                                    <xsl:otherwise>
                                        background-color: rgb(255, 255, 255);
                                    </xsl:otherwise>
                                </xsl:choose> 
                            </xsl:variable>

                            <xsl:variable name="NotFound">
                                <xsl:choose>
                                    <xsl:when test="editorial = 'No aplicable'">
                                        background-color: rgb(242, 108, 78);
                                    </xsl:when>
                                </xsl:choose> 
                            </xsl:variable>
           
                            
                        <tr>
                       <!-- <xsl:sort select="especie" data-type="text" order="ascending"/> -->
                            <td class="nombre"><xsl:value-of select="titulo"/></td>
                            <td><xsl:value-of select="autor"/></td>
                            <td><xsl:value-of select="anio_publicacion"/></td>
                            <td style="{$genero}"><xsl:value-of select="genero"/></td>
                            <td><xsl:value-of select="paginas"/></td>
                            <td style="{$NotFound}"><xsl:value-of select="editorial"/></td>
                            <td><xsl:value-of select="precio"/></td>
                            <td class="{$color}"><xsl:value-of select="valoracion"/></td>
                        </tr>
                    </xsl:for-each>
            
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>