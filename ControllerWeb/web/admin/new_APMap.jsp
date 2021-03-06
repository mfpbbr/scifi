<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:ui="http://java.sun.com/jsf/facelets" xmlns:h="http://java.sun.com/jsf/html"
      xmlns:f="http://java.sun.com/jsf/core">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Controlador Scifi - Adicionar Ponto de Acesso</title>
        <script type="text/javascript" src="../javascript/jquery-1.8.3.min.js"></script>
        <link rel="stylesheet" href="../css/thickbox.css" type="text/css" media="screen" />
        <script language="javascript" type="text/javascript" src="../javascript/thickbox.js"></script>
        <script type="text/javascript" src="../javascript/preloadImages.js"></script>
        <script type="text/javascript" charset="UTF-8" src="../javascript/utils.js"></script>
        <script type="text/javascript" charset="UTF-8" src="../javascript/time_aps.js"></script>        
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>

        <div id="tudo">

            <div id="topo">

                <div id="logo"><ul><li><a href="admin.jsf" title="Voltar � p�gina inicial"></a></li></ul></div>

                <div id="figuraTopo"></div>

            </div>

            <div id="barraTopo"></div>

            <div id="coluna_esq">

                <div id="menuTopo">MENU</div>

                <div class="barraMenu"></div>

                <div id="menu">
                    <ul>
                        <li class="APs"><a href="#" title="Pontos de Acesso"></a>
                            <ul>
                                <li class="adicionarAP"><a href="new_ap.jsf" title="Adicionar Ponto de Acesso"></a></li>
                                <li class="editarAPs"><a href="edit_ap_info.jsf" title="Editar Pontos de Acesso"></a></li>
                                <li class="visualizarAPs"><a href="ap_info.jsf" title="Visualizar Pontos de Acesso"></a></li>
                            </ul>
                        </li>
                        <li class="regioes"><a href="#" title="Regi�es de Controle"></a>
                            <ul>
                                <li class="adicionarRegiao"><a href="new_region.jsf" title="Adicionar Regi�o de Controle"></a></li>
                                <li class="excluirRegiao"><a href="remove_region.jsf" title="Excluir Regi�o de Controle"></a></li>
                            </ul>
                        </li>
                        <li class="comandos"><a href="commander.jsf" title="Executar Comandos do Controlador"></a></li>
                        <li class="configurar"><a href="edit_parameters.jsf" title="Editar Configura��es do Controlador"></a></li>
                        <li class="mrtg"><a href="editMap.jsp?type=10" target="_blank" title="Monitoramento"></a></li>
                    </ul>
                </div>
            </div>

            <div id="coluna_dir">
                <div id="titulo">Adicionar Ponto de Acesso<label id="info_unreachable"><label></label><a href="#" title="Controlador Scifi - Pontos de acesso incomunicantes" class="thickbox"></a><img src="../figuras/wait.gif"/></label> <a href="logout.jsf" id="logout">Logout</a> </div>
                <div class="barraConteudo"></div>
                <div id="conteudo">
                    <div id="tableCenter">
                        <f:view>                            
                            <h:form id="newAPForm" >

                                <table>
                                    <tr>
                                        <td colspan="2" class="tdERRMsg"></td>
                                    </tr>
                                    <tr>
                                        <td class="tdFormat"><h:outputText value="MAC da interface sem fio:" /> </td>
                                        <td class="tdInput"><h:inputText id="APMAC" value="#{JNewAPMapBean.MAC}" validator="#{JAPInfoValidator.checkMAC}" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="tdERRMsg"><h:message for="APMAC" errorClass="errorMessage" infoClass="infoMessage" /></td>
                                    </tr>
                                    <tr>
                                        <td class="tdFormat"><h:outputText value="IP:" /></td>
                                        <td class="tdInput"><h:inputText id="APIP" value="#{JNewAPMapBean.IP}" validator="#{JAPInfoValidator.checkIP}" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="tdERRMsg"><h:message for="APIP" errorClass="errorMessage" infoClass="infoMessage" /></td>
                                    </tr>

                                    <tr>
                                        <td class="tdFormat"><h:outputText value="Localiza��o:" /></td>
                                        <td class="tdInput"><h:inputText id="APLocation" value="#{JNewAPMapBean.location}" validator="#{JAPInfoValidator.isEmpty}" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="tdERRMsg"><h:message for="APLocation" errorClass="errorMessage" infoClass="infoMessage" /></td>
                                    </tr>

                                    <tr>
                                        <td class="tdFormat"><h:outputText value="Lista de Pot�ncias:" /></td>
                                        <td class="tdInput"><h:inputText id="APListTxPower" value="#{JNewAPMapBean.listTxPower}" validator="#{JAPInfoValidator.checkListTxPower}" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="tdERRMsg"><h:message for="APListTxPower" errorClass="errorMessage" infoClass="infoMessage" /></td>
                                    </tr>

                                    <tr>
                                        <td class="tdFormat"><h:outputText value="Limite de Carga Baixa:" /></td>
                                        <td class="tdInput"><h:inputText id="APUnderloadThreshold" converterMessage="Valor inv�lido. Este campo deve conter um inteiro positivo." required="#{true}" requiredMessage="Este valor deve ser preenchido." value="#{JNewAPMapBean.underloadThreshold}" validator="#{JAPInfoValidator.isUnsignedInteger}" styleClass="newAPLine"/> </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="tdERRMsg"><h:message for="APUnderloadThreshold" errorClass="errorMessage" infoClass="infoMessage" /></td>
                                    </tr>

                                    <tr>
                                        <td class="tdFormat"><h:outputText value="Limite de Sobrecarga:" /></td>
                                        <td class="tdInput"><h:inputText id="APOverloadThreshold" converterMessage="Valor inv�lido. Este campo deve conter um inteiro positivo." required="#{true}" requiredMessage="Este valor deve ser preenchido." value="#{JNewAPMapBean.overloadThreshold}" validator="#{JAPInfoValidator.checkOverloadThreshold}" styleClass="newAPLine"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="tdERRMsg"><h:message for="APOverloadThreshold" errorClass="errorMessage" infoClass="infoMessage" /></td>
                                    </tr>

                                    <tr>
                                        <td class="tdFormat"><h:outputText value="Latitude:" /></td>
                                        <td class="tdInput"><h:inputText id="APLatitude" converterMessage="Valor inv�lido" required="#{true}" requiredMessage="Este valor deve ser preenchido." value="#{JNewAPMapBean.latitude}" validator="#{JAPInfoValidator.checkLatitude}" styleClass="newAPLine"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="tdERRMsg"><h:message for="APLatitude" errorClass="errorMessage" infoClass="infoMessage" /></td>
                                    </tr>

                                    <tr>
                                        <td class="tdFormat"><h:outputText value="Longitude:" /></td>
                                        <td class="tdInput"><h:inputText id="APLongitude" converterMessage="Valor inv�lido" required="#{true}" requiredMessage="Este valor deve ser preenchido." value="#{JNewAPMapBean.longitude}" validator="#{JAPInfoValidator.checkLongitude}" styleClass="newAPLine"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="tdERRMsg"><h:message for="APLongitude" errorClass="errorMessage" infoClass="infoMessage" /></td>
                                    </tr>

                                    <tr>
                                        <td class="tdFormat"><h:outputText value="Regi�o:" /></td>
                                        <td class="tdInput"><h:selectOneMenu id="APRegion" value="#{JNewAPMapBean.region}" required="#{true}" requiredMessage="Uma regi�o deve ser selecionada."><f:selectItems value="#{JAPListBean.regions}"/></h:selectOneMenu></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="tdERRMsg"><h:message for="APRegion" errorClass="errorMessage" infoClass="infoMessage" /></td>
                                    </tr>

                                </table>

                                <h:panelGrid columns="1" styleClass="tableFinal">
                                    <h:commandButton action="#{JNewAPMapBean.addAP}" onclick="javascript: trocaCursor('progress',this);" value="Adicionar AP" styleClass="submit"></h:commandButton>
                                </h:panelGrid>

                            </h:form>
                        </f:view>
                    </div>
                </div>
            </div>
            <div class="clr"></div>

            <div id="rodape">
                <ul>
                    <li class="uff"><a href="http://www.uff.br/" title="Universidade Federal Fluminense"></a></li>
                    <li class="midiacom"><a href="http://www.midiacom.uff.br/" title="Laborat�rio M�diacom"></a></li>
                    <li class="computacao"><a href="http://www.ic.uff.br/" title="Instituto de Computa��o UFF"></a></li>
                    <li class="engenharia"><a href="http://www.engenharia.uff.br/" title="Escola de Engenharia UFF"></a></li>
                    <li class="rnp"><a href="http://www.rnp.br/" title="Rede Nacional de Pesquisa"></a></li>
                </ul>
            </div>

        </div>
    </body>
</html>
