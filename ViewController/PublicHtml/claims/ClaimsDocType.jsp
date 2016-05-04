<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
    response.setHeader("Cache-Control","no-store"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
%>
<html>

  <head>
    <meta http-equiv="expires" content="now">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">

    <title>Document Types</title>
    <link type="text/css" rel="stylesheet" href="css/boto.css"/>
    <link href="styles/menu_home.css" type="text/css" rel="stylesheet"></link>
    <link type="text/css" rel="stylesheet" href="css/displaytagex.css"/>
    <script language="JavaScript" src="js/menu_home.js"></script>
    <script language="JavaScript" src="js/menu.js"></script>
     
     <script type="text/javascript" language="javascript"> 
     
     function vFindControl(elementRefa){
      if (validateRequired(document.forms[0])){
         document.forms[0].elements["txtHOperation"].value = elementRefa.value;
         document.forms[0].submit();
     } 
     }
     function SearchCalled(elementRefa){
     
      document.forms[0].elements["txtHOperation"].value = elementRefa.value;
         document.forms[0].submit();
     }
     
      function delClicked(){
            if (validateRequired(document.forms[0])){
                if (!(!confirm('Are you sure to delete the selected record?')))
                {
                document.forms[0].elements["txtHOperation"].value="Delete";
                //document.forms[0].action = document.forms[0].action + "&mode=d" ;
                //document.forms[0].action = document.forms[0].action + "&mode=d" ;
                //document.forms[0].action = document.forms[0].action + "?methodToCall=onClasifiTypeDelete" ;
                document.forms[0].submit();
                }
            }
    }
     
 
         function clearClicked(elementRefa){
     //  document.getElementById("txtHOperation").value = elementRefa.value;
         document.forms[0].elements["txtHOperation"].value=elementRefa.value;
            document.forms[0].elements["documtype"].value="";
            document.forms[0].elements["desc"].value="";
            document.forms[0].elements["docuStatus"].value="";           
            document.forms[0].txtHOperation.value="";
          //  document.forms[0].btndelete.disabled=true; 
      
       }
     
  var count=0;
    var intval="";
     function loading(){
        
        //alert('saveMessage = ' + saveMessage);
        document.forms[0].htxtMode.value='';
        document.forms[0].documtype.className="textboxur"; 
         document.forms[0].documtype.readOnly=true;
        window.status="Done.";
     //   document.forms[0].btndelete.disabled=true;
        var msg;
        msg=document.forms[0].htxtDBMessage.value;
        
       if (msg=="DELSUCCESS")
        {
            saveMessage ='Document Types deleted successfully.';
            //alert('delete success');
            //intval=window.setInterval("showStatus()",500);
            alert(saveMessage);
            
        }else if(msg=="DELFAIL"){
        
            alert('Document Types could not be deleted.');
        
        }else if(msg=="UPDATED_SUCESS"){
        
            saveMessage ='Document Types Updated successfully.';
            //intval=window.setInterval("showStatus()",500);
            alert(saveMessage);
        
        }
           
           else if(msg=="INSERTED_SUCESS"){
        
            saveMessage ='Document Types saved successfully.';
            //intval=window.setInterval("showStatus()",500);
            alert(saveMessage);
        
        } else if(msg=="SELECTED"){
          //  document.forms[0].btndelete.disabled=false; 
    }
   
    }
     function showStatus(){
    
        window.status=saveMessage ;
        
        count++;
        if (count==20)
        {
            //alert('count= ' + count);
            
            window.clearInterval(intval);

            window.status="Done ";
        }
    }


     
  
     </script>
     
  </head>
  <body onload= "loading()">
  <html:errors/>
 <html:form  action="/DocumentType.do?methodToCall=getdocumentcode" method="post">
 <html:javascript formName="DocumentType"/>

 
 <table width="100%" border="0" cellspacing="0"  cellpadding="1">
<tr>
        <td valign="top" class="head_bgcolor">Document Types</td>
        </tr>
        <tr>
        <td valign="top" class="padding5px">
          <table width="100%" border="0" cellspacing="0"
        cellpadding="0">
        <tr>
        <td valign="top">
        <table border="0" class="details_table"
        cellspacing="0" cellpadding="0">
        <tr>
        <td>Details</td>
</tr>
        </table>
        </td>
        </tr>
        <tr>
        <td valign="top">
        <table class="field_table" width="100%"
        border="0" cellspacing="0"
        cellpadding="0">
        <tr>
        <td valign="top">
        
        <tr>
        <td>
        <table width="100%"
        border="0"
        cellspacing="0"
        cellpadding="3">
        <tr>
        <td width="100" >
        <bean:message key="Document.Type.Code"/>
        <bean:message key="prompt.Common.LabelSuffix"/>
        <span class="red12"></span>
        </td>
        <td width="100">
        
        <html:text property="documtype" maxlength="3" name="DocumentType" style="width:83px;" />
         
        </td>
        <td width="90">
           <bean:message key="Descrip.Code"/>
            <bean:message key="prompt.Common.LabelSuffix"/>
          <span class="red12">*</span>
        </td>
        <td>
          
        <html:text property="desc" maxlength="30" name="DocumentType" style="width:200px;"  />
         
        </td>
      </tr>
      <tr>
        <td><bean:message key="DocumentType.Status"/>
            <bean:message key="prompt.Common.LabelSuffix"/>
            <span class="red12">*</span></td>
        <td>
         <html:select property="docuStatus" 
                         name="DocumentType">
              <html:option value="">---Select---</html:option>
              <html:option value="A">Active</html:option>
              <html:option value="I">Inactive</html:option>
            </html:select>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
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
                           <bean:message key="prompt.Comman.Mandatory"/></td>
    <td>
      <div align="right">
       <html:hidden property="htxtMode"  value=""/>
          <html:hidden property="htxtDBMessage" name= "DocumentType"/> 
         <html:button  property="btnSave" value="Save" onclick="vFindControl(this);"/> 
    <!--    <html:button property="btndelete" value="Delete" onclick="delClicked();"/>    -->
         <html:button property="btnSearch" value="Search" onclick="SearchCalled(this);"/>
        <html:button property="btnClear" value="Clear" onclick="clearClicked(this);" />

         <html:hidden property="txtHOperation"
                      name="DocumentType"
                      value="0"/>
        <html:hidden property="txtHMode"
                       name="DocumentType"
                       value="1,2,3,4"/>
         <html:hidden property="result"
                 name="DocumentType"/>       
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
<tr>
<td valign="top" class="padding5px">
<table width="100%" border="0" cellspacing="0"
     cellpadding="0">
<tr>
  <td valign="top">
    <table border="0" class="details_table"
           cellspacing="0" cellpadding="0">
      <tr>
        <td>List</td>
      </tr>
    </table>
  </td>
</tr>
<tr>
  <td valign="top">
    <table class="field_table" width="100%"
           border="0" cellspacing="0"
           cellpadding="0">
<tr>
            <td valign="top"
                style="padding:5px;">
         
          
            <display:table name="RegCat"
                       requestURI="DocumentType.do?methodToCall=setDocDetails"
                       id="row"
                       class="dataTable"
                       defaultsort="1"
                       defaultorder="ascending"
                       pagesize="5"
                       cellspacing="0"
                       >
  
               <display:column property="doccode"
                           title="Document Code"
                          autolink="true"
                          href="DocumentType.do?methodToCall=setDocDetails"
                          paramId="docCode"
                          sortable="true"
                         style="width:120px"/>
                         
             <display:column property="descrip"
                                title="Description"
                                sortable="true"
                                />
               
                <display:column property="dispAction"
                                title="Active/Inactive"
                                sortable="true"
                                style="width:120px"/>
                  
 <display:setProperty name="paging.banner.placement" value="bottom"  /> 
            <display:setProperty name="paging.banner.some_items_found" value='<span class="pagebanner">Records {2} to {3} of {0}</span>'  /> 
            <display:setProperty name="paging.banner.full">
            <span class="pagelinks" style="padding-left:75px;"><a href="{1}"><img src="images/back_last.jpg" border="0" /></a>&nbsp;<a href="{2}"><img src="images/back_btn.jpg" border="0" /></a>&nbsp;<a href="{3}"><img src="images/next_btn.jpg" border="0" /></a>&nbsp;<a
            href="{4}"><img src="images/next_last.jpg" border="0" /></a></span>
            </display:setProperty>                                                                        
            <display:setProperty name="paging.banner.first">
            <span class="pagelinks" style="padding-left:75px;"><img src="images/back_last.jpg" border="0" />&nbsp;<img src="images/back_btn.jpg" border="0" /><a
            href="{3}">&nbsp;<img src="images/next_btn.jpg" border="0" /></a>&nbsp;<a href="{4}"><img src="images/next_last.jpg" border="0" /></a>
            </span>
            </display:setProperty>                                                                        
            <display:setProperty name="paging.banner.last">
            <span class="pagelinks" style="padding-left:75px;"><a
            href="{1}"><img src="images/back_last.jpg" border="0" /></a><a href="{2}">&nbsp;<img src="images/back_btn.jpg" border="0" /></a>&nbsp;<img src="images/next_btn.jpg" border="0" />&nbsp;<img src="images/next_last.jpg" border="0" /> </span>
            </display:setProperty>


                       
                 
              </display:table>


                           
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
                                 
</html:form>
	
      
    </body>
</html>

