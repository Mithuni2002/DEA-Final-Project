<%@ include file="../includes/head.jsp" %>
<%@ include file="../includes/navbar.jsp" %>
<div class="container mt-5 text-center">
  <h3 class="text-success">Payment Successful!</h3>
  <p>Thank you for booking your appointment at Asiri Hospital.</p>
  <p>Your channel number will be provided shortly by the system.</p>
  <a href="<%=request.getContextPath()%>/patient/index.jsp" class="btn btn-primary mt-3">Back to Home</a>

</div>
<%@ include file="../includes/footer.jsp" %>
<%@ include file="../includes/scripts.jsp" %>