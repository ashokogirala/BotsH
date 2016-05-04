<%@ page import="com.vtfs.dao.CommonDAO,java.util.ArrayList,com.vtfs.dto.claims.CaptureClaimDtlTrnPatiVO" %>
<%

try{
 ArrayList lsttrn = (ArrayList)request.getSession().getAttribute("Trnlist");
 boolean testFlag = true;
 for(int i=0;i<lsttrn.size();i++){
    CaptureClaimDtlTrnPatiVO trainVO=(CaptureClaimDtlTrnPatiVO)lsttrn.get(i);
      if(trainVO!=null){
      
         if(!(trainVO.getBotalearnerno().equalsIgnoreCase(""))){
           String leanerIDResult=new CommonDAO().checkLearnerID(trainVO.getBotalearnerno());    
           if(leanerIDResult.equalsIgnoreCase("FAIL")){
            testFlag=false;
            break;
           }
         }  
      }
 }
 if(testFlag==false)
 out.print("FAIL");
  else
out.print("SUCCESS");
}catch(Exception e){e.printStackTrace();}
%>