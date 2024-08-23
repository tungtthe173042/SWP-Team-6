<!-- Jquery JS-->
<script src="${pageContext.request.contextPath}/staff/common/vendor/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JS-->
<script src="${pageContext.request.contextPath}/staff/common/vendor/bootstrap-4.1/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/staff/common/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="${pageContext.request.contextPath}/staff/common/vendor/slick/slick.min.js">
</script>
<script src="${pageContext.request.contextPath}/staff/common/vendor/wow/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/staff/common/vendor/animsition/animsition.min.js"></script>
<script src="${pageContext.request.contextPath}/staff/common/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
</script>
<script src="${pageContext.request.contextPath}/staff/common/vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/staff/common/vendor/counter-up/jquery.counterup.min.js">
</script>
<script src="${pageContext.request.contextPath}/staff/common/vendor/circle-progress/circle-progress.min.js"></script>
<script src="${pageContext.request.contextPath}/staff/common/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/staff/common/vendor/chartjs/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/staff/common/vendor/select2/select2.min.js">
</script>

<!-- Main JS-->
<script src="${pageContext.request.contextPath}/staff/common/js/main.js"></script>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const insuranceCells = document.querySelectorAll('.truncate');

        insuranceCells.forEach(function (cell) {
            const fullText = cell.textContent;
            if (fullText.length > 15) {
                const truncatedText = fullText.substring(0, 15) + '...';
                cell.textContent = truncatedText;
                cell.setAttribute('title', fullText); // Set full text as tooltip
            }
        });
    });
</script>