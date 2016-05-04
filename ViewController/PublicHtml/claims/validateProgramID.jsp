<%@ page import="com.vtfs.dao.CommonDAO,java.util.ArrayList,com.vtfs.dto.claims.CaptureClaimDtlPgmVO" %>
<%
ArrayList lstpgm = (ArrayList)request.getSession().getAttribute("Pgmlist");
 boolean testFlag = true;
 for(int i=0;i<lstpgm.size();i++){
    CaptureClaimDtlPgmVO pgmVO=(CaptureClaimDtlPgmVO)lstpgm.get(i);
      if(pgmVO!=null){
           String pgmIDResult=new CommonDAO().checkProgramID(pgmVO.getProgram());    
           if(pgmIDResult.equalsIgnoreCase("FAIL")){
            testFlag=false;
            break;
           }
           
      }
 }
 if(testFlag==false)
 out.print("FAIL");
  else
out.print("SUCCESS");

%>