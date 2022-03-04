// 드롭다운 형식으로 년/월/일 생성 
function setSelectFormCalendar(id){ 
    var monthNames = ["", "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]; 
    var qntYears = 5; var selectYear = $("#"+id+"Year"); var selectMonth = $("#"+id+"Month"); 
    var selectDay = $("#"+id+"Day"); 
    var currentYear = new Date().getFullYear(); 
    // var currentYear = 2021; 
    
    for (var y = 0; y < qntYears; y++){ 
        var date = new Date(currentYear); 
        var yearElem = document.createElement("option"); 
        yearElem.value = currentYear 
        yearElem.textContent = currentYear; 
        selectYear.append(yearElem); 
        currentYear++; 
    } 
        
    for (var m = 0; m < 12; m++){ 
        var monthNum = new Date(currentYear, m).getMonth()+1; 
        var month = monthNames[monthNum]; 
        var monthElem = document.createElement("option"); 
        if(monthNum<10){monthNum='0'+monthNum} 
        monthElem.value = monthNum; 
        monthElem.textContent = month; 
        selectMonth.append(monthElem); 
    } 
    
var d = new Date(); 
var month = d.getMonth()+1; 
var year = d.getFullYear(); 
var day = d.getDate(); 

if(month<10){month='0'+month} selectYear.val(year); 

selectYear.on("change", AdjustDays); 
selectMonth.val(month); 
selectMonth.on("change", AdjustDays); 

AdjustDays(); 
selectDay.val(day) 

    function AdjustDays(){ 
        var year = selectYear.val(); 
        var month = parseInt(selectMonth.val()) + 1; 
        selectDay.empty(); 
        //get the last day, so the number of days in that month 
        var days = new Date(year, month, 0).getDate(); 

        //lets create the days of that month 
        for (var d = 1; d <= days; d++){ 
            var dayElem = document.createElement("option"); 
            dayElem.value = d; 
            dayElem.textContent = d;
            selectDay.append(dayElem); 
        } 
    } 
} 


<script>
    setSelectFormCalendar("excpStr");
</script> 

<html> 
    <select id="excpStrYear" ></select>
    <select id="excpStrMonth" ></select>
</html>
