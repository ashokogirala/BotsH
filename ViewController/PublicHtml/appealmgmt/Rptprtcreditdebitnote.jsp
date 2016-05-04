<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
 <link href="css/displaytagex.css" rel="stylesheet" type="text/css"/>
 
<%@ page import="java.io.*" %> 
<%@page language="java" import="java.sql.*" %>
 <%@page language="java" import="java.util.*,com.vtfs.util.VTFSLogger" %>
        <link rel="stylesheet" type="text/css" media="all" href="js/skins/aqua/theme.css" title="Aqua" />
            <script language="javascript" type="text/javascript" src="js/RegisterCategory.js"></script>
            <script type="text/javascript" src="js/calendar_inc.js"></script>
            <script type="text/javascript" src="js/calendar.js"></script>
            <script type="text/javascript" src="js/lang/calendar-en.js"></script> 
 
 <%
        java.util.Calendar currentDate =  java.util.Calendar.getInstance();
        java.text.SimpleDateFormat formatter= 
        new java.text.SimpleDateFormat("dd-MMM-yy@HH:mm");
        String dateNow=formatter.format(currentDate.getTime());  
        
      // String fromYear=(String)request.getSession().getAttribute("FromYear");
       // String toYear=(String)request.getSession().getAttribute("ToYear");
        String FDate=(String)request.getSession().getAttribute("FDate");
        String TDate=(String)request.getSession().getAttribute("TDate");
        String notetype=(String)request.getSession().getAttribute("notetype");
      
        VTFSLogger.logDebug("from date==>"+FDate);
        VTFSLogger.logDebug("todate date==>"+TDate);
        String username=(String)request.getSession().getAttribute("CUserID");
      //  if(fromYear==null) fromYear="";
     //   if(toYear==null) toYear="";
        if(FDate==null) FDate="";
        if(TDate==null) TDate="";
        if(username==null) username="";
        if(notetype==null) notetype="";
        
        ArrayList rptGetList=(ArrayList)request.getAttribute("getRptNote");
        request.getSession().setAttribute("getRptNote",rptGetList);
        int rptGetListSize;
        
        if(rptGetList==null){
        rptGetListSize=0;
        }else{
        rptGetListSize=rptGetList.size();
        }
         String generateFlag=  (String)request.getSession().getAttribute("generateFlag");
        if(generateFlag==null)
        generateFlag="";
        
        
        %>
        
          <script type="text/javascript">
    
    //clear click js
    function clearClicked(){
        document.forms[0].elements["htxtMode"].value="CLEAR";
        document.forms[0].elements["FDate"].value="";
        document.forms[0].elements["TDate"].value="";
        document.forms[0].elements["notetype"].value="";
       // document.forms[0].submit();
       
    }
       function submitClicked()
            { 
           // alert("Generate");
            if(validateRequired(document.forms[0])){             
             // checkFromDates(this,document.forms[0].elements['FDate'],document.forms[0].elements['fromYear']);
           //    checkToDates(this,document.forms[0].elements['TDate'],document.forms[0].elements['fromYear')];
              //  var fromyear  =document.forms[0].elements["fromYear"].value;
              //  var toyear  =document.forms[0].elements["toYear"].value;
                var str1  = document.forms[0].elements["FDate"].value;
                var str2  =document.forms[0].elements["TDate"].value;
                var notetype  = document.forms[0].elements["notetype"].value;
               if((comparWithSysDates(str1))&&(comparWithSysDates(str2))){
             if(comparDates(str1,str2)){   
               window.open("reportJSP/PrintCreditDebitReport.jsp?FDate="+str1+"&TDate="+str2+"&notetype="+notetype,'classPop', "location=1,status=1,scrollbars=1,width=900,height=750,left=100,top=150"); 
              //document.forms[0].elements["htxtMode").value="Generate";
              //document.forms[0].submit();
                }
                }
                }
            }
          /*  function changeStyle(){
                document.forms[0].toYear.className='textboxur5'; 
       onload="changeStyle();"
            }*/
            
    
    </script>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Rptprtcreditdebitnote</title>
    <link type="text/css" rel="stylesheet" href="styles/menu.css"/>
    <link type="text/css" rel="stylesheet" href="styles/boto.css"/>
    <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
    <script language="javascript" type="text/javascript" src="js/menu.js"></script>    
    <script language="javascript" type="text/javascript" src="js/VTFSCommon.js"></script>
       
    </head>
    <body ><html:errors/>
    <html:form action="/RptAppeal" method="post">
    <html:javascript formName="RptAppeal"/>
       
     
     <table width="735" border="0" cellspacing="0"
                               cellpadding="1">
                          <tr>
                            <td valign="top" class="head_bgcolor">
                              <bean:message key="prompt.appealcreditdebit.Heading"/>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%"
                                     border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td valign="top" class="padding5px">
                                    <table width="100%" border="0"
                                           cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td valign="top">
                                          <table border="0"
                                                 class="details_table"
                                                 cellspacing="0"
                                                 cellpadding="0">
                                            <tr>
                                              <td>
                                                <bean:message key="prompt.appealcreditdebit.Details"/>
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td valign="top">
                                          <table class="field_table"
                                                 width="100%" border="0"
                                                 cellspacing="0"
                                                 cellpadding="0">
                                            <tr>
                                              <td valign="top">
                                                <table width="100%" border="0"
                                                       cellspacing="0"
                                                       cellpadding="0">
                                                  <tr>
                                                    <td style="height:50px;">
                                                    
                                                     <table width="100%" border="0"
                                                       cellspacing="0"
                                                       cellpadding="3">
                                            
                                                 
                                                  <tr>
                                                    <td>From Date:<span class="red12">*</span></td>
                                                    <td><html:text property="FDate" name="RptAppeal" style="width:110px;hight:14px" /> <a>
                                                                              <img alt="Calender"
                                                                                   align="Center"
                                                                                   src="images/cal.JPG"
                                                                                   onclick="return showCalendar('FDate','0','%d-%b-%Y',false,false);"
                                                                                   class="cursorHand"/>
                                                                            </a></td>
                                                    <td colspan="2">To Date:<html:text property="TDate" name="RptAppeal" style="width:110px;hight:14px"/> <a><img alt="Calender" align="Center" src="images/cal.JPG"  onclick="return showCalendar('TDate','0','%d-%b-%Y',false,false);" class="cursorHand"></img></a></td>
                                                 
                                                 </tr>
                                                 
                                                  <tr>
                                                    <td>Note Type:<span class="red12">*</span></td>
                                                    <td colspan="3"><html:select property="notetype"
                                                                         name="RptAppeal"  style="width:110px;">
                                                              <html:option value=""
                                                                           >---Select---</html:option>
                                                              <html:option  value="Credit"
                                                                           >Credit</html:option>
                                                                           <html:option value="Debit"
                                                                           >Debit</html:option>
                                                            </html:select></td>
                                                   
                                                 </tr>
                                                    
                                                    </table>
                                                   
                                                    </td>
                                                  </tr>
                                                  <tr>
                                                    <td class="bordertop">
                                                      <table width="100%"
                                                             border="0"
                                                             cellspacing="0"
                                                             cellpadding="3">
                                                        <tr>
                                                          <td class="mandatory">
                                                            <bean:message key="prompt.Comman.Mandatory"/>
                                                          </td>
                                                          <td>
                                                            <div align="right">
                                                            <html:hidden property="htxtMode" name="RptAppeal" />
                                                                <html:button property="btnGemerate"
                                                                           value="Generate" onclick="submitClicked();"/>
                                                                <html:button property="btnClear"
                                                                           value="Clear" onclick="clearClicked();"   />
                                                            </div>
                                                          </td>
                                                        </tr>
                                                      </table>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                    <!--    <tr>
                        <td valign="top" class="padding5px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                        <td valign="top" class="padding5px" align="left">
                                  
                     <%
                         if(rptGetListSize>0)
                         { %>
                image end  *****************Grid Logo starts *****************              
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                            <tr>
                            <td valign="middle">
                            <table width="10%" border="0" class="details_table" cellspacing="0" cellpadding="0">
                            <tr>
                           
                            </tr>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr> 
                            <td align="right" width="10%" ><img src="images/bota_logo.jpg" /></td>
                            </td>
                            <td align="left" width="50%"
                            style="color:rgb(0,0,0); font-size:small;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vocational&nbsp;Training&nbsp;Fund&nbsp;System&nbsp;(VTFS)</b></td>
                            <td>
                            <div align="left">
                            <p>
                            </p><p>
                            </p><p>
                             Printed on:&nbsp;<%=dateNow%></p>
                            <p>Printed&nbsp;by:           <%=username%>
                            </p>
                            </div>       
                            </td>
                            
                            </table>
                            <tr>
                            <td align="left"
                            style="font-size:small; color:rgb(0,0,0);"
                            width="84%">
                            <div align="left"><u>
                            <h5 align="center">
                           </h5></u>
                            </div>
                            </td>
                            </tr>
                            <tr>
                            <td align="left" colspan="2" height="23" width="50%">
                             Financial Year:&nbsp;<%=%>-<%=%>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Note Type:&nbsp;<%=notetype%>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            </tr>    
                            </table>
                   *****************Grid Logo ends *****************
                                
                                
                        </tr>
                            <tr>
                          <td valign="top"><table class="field_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                              </tr>
                             <td valign="top"><table class="field_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                              </tr>
                              <tr>
                              <td>
                            
                              <display:table name="${getRptNote}" 
                                        requestURI="/RptAppeal.do" 
                                        class="dataTable"
                                        defaultorder="ascending"
                                        pagesize="7" 
                                        export="true" 
                                       cellspacing="0"
                                    >
                                   
                    <%if(notetype.equalsIgnoreCase("CREDIT")){   %>
                                      <display:column 
                                        property="creditrefno" 
                                        title="Credit Ref No" 
                                        sortable="true"                                         
                                         paramId="creditref"
                                        />
                                         
                        <%}else {%>
                                        <display:column 
                                        property="creditrefno" 
                                        title="Debit Ref No" 
                                        sortable="true" 
                                        autolink="true"
                                         href="CreditNote.do?methodToCall=setCreditNoteRecord"
                                         paramId="creditref"
                                        />
                                            
                            <%}%>
                             <%if(notetype.equalsIgnoreCase("CREDIT")){   %>
                             <display:caption title="Credittitle">Credit List</display:caption>
                                <%}else {%>
                            <display:caption title="Debittitle">Debit List</display:caption>
                               <%}%>
                                    <display:column 
                                        property="apprefno" 
                                        title="Appeal Ref No" 
                                        sortable="true"
                                        />
                                    <display:column 
                                        property="vtfRegNo" 
                                        title="VTF Registraion No" 
                                        sortable="true" 
                                        />
                                    <display:column 
                                        property="claimRefNo" 
                                        title="Claim Ref No" 
                                        sortable="true"
                                        />
                                    <display:column 
                                        property="amount" 
                                        title="Amount" 
                                        sortable="true"
                                        
                                        />
                                               
                                                <display:setProperty name="export.csv" value="false" />
                                                <display:setProperty name="export.xml" value="false" />
                                                <display:setProperty name="export.pdf" value="true" />
                                                <display:setProperty name="export.decorated" value="true" />                                             
                                            <display:setProperty name="export.pdf.filename" value="PrintGenerateCredit/DebitNote.pdf" />
                                            <display:setProperty name="export.excel.filename" value="PrintGenerateCredit/DebitNote.xls" />
                                                 <display:setProperty name="paging.banner.placement" value="bottom"  /> 
                                                 <display:setProperty name="paging.banner.some_items_found" value='<span class="pagebanner">Records {2} to {3} of {0}</span>'  /> 
                                            
                                                 <display:setProperty name="paging.banner.full">
                                                                        <span class="pagelinks"><a href="{1}"><img src="images/back_last.jpg" border="0" /></a><a href="{2}"><img src="images/back_btn.jpg" border="0" /></a><a href="{3}"><img src="images/next_btn.jpg" border="0" /></a><a
                                                                        href="{4}"><img src="images/next_last.jpg" border="0" /></a></span>
                                                                        </display:setProperty>                                                                        
                                                                        <display:setProperty name="paging.banner.first">
                                                                        <span class="pagelinks"><img src="images/back_last.jpg" border="0" /><img src="images/back_btn.jpg" border="0" /><a
                                                                        href="{3}"><img src="images/next_btn.jpg" border="0" /></a><a href="{4}"><img src="images/next_last.jpg" border="0" /></a>
                                                                        </span>
                                                                        </display:setProperty>                                                                        
                                                                        <display:setProperty name="paging.banner.last">
                                                                        <span class="pagelinks"><a
                                                                        href="{1}"><img src="images/back_last.jpg" border="0" /></a><a href="{2}"><img src="images/back_btn.jpg" border="0" /></a><img src="images/next_btn.jpg" border="0" /><img src="images/next_last.jpg" border="0" /> </span>
                                                                        </display:setProperty>
                                
                                </display:table>
                                
                             <%   }else{
                    if(generateFlag.equalsIgnoreCase("GENERATE")){
                    %>
                   No Record Found
                   
                  <%} }%>
                  
                 <div id="leftMenu">        
              </div>
              </td>
              </tr>-->
              
                  <tr>
                    <td valign="top"
                        class="padding5px">&nbsp;</td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        
    </html:form>
    
    </body>
  
</html>