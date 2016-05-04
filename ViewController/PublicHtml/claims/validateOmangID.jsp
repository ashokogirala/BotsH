<%@ page import="com.vtfs.dao.CommonDAO,java.util.ArrayList,com.vtfs.dto.claims.CaptureClaimDtlTrnPatiVO" %>
<%
 ArrayList lsttrn = (ArrayList)request.getSession().getAttribute("Trnlist");
 boolean testFlag = true;
 for(int i=0;i<lsttrn.size();i++){
    CaptureClaimDtlTrnPatiVO trainVO=(CaptureClaimDtlTrnPatiVO)lsttrn.get(i);
      if(trainVO!=null){
           String omangResult=new CommonDAO().checkOmangID(trainVO.getOmangid());    
           if(omangResult.equalsIgnoreCase("FAIL")){
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