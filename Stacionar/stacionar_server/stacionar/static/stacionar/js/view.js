$(document).ready(function() {
    $("#dani_button").mouseover(function() {
        $("#dani_button").css("background", "#5B6ED4");
        $(".nav_div").css("display", "flex");
    });

    $("#dani_button").mouseout(function() {
        if (event.relatedTarget.className != "nav_sub_button") {
            $("#dani_button").css("background", "#3f51b5");
            $(".nav_div").css("display", "none");
        };
    });

    $(".nav_div").mouseout(function() {
        if (event.relatedTarget.className != "nav_sub_button") {
            $("#dani_button").css("background", "#3f51b5");
            $(".nav_div").css("display", "none");
        };
    });

    $("#id_type_patient").change(function() {
        if ($("#id_type_patient").find(":selected").val() == 1) {
            $("#planovy1").css("display", "flex");
            $("#planovy2").css("display", "flex");
            $("#urgentny").css("display", "none");
        } else if ($("#id_type_patient").find(":selected").val() == 2) {
            $("#urgentny").css("display", "flex");
            $("#planovy1").css("display", "none");
            $("#planovy2").css("display", "none");
        } else {
            $("#planovy1").css("display", "none");
            $("#planovy2").css("display", "none");
            $("#urgentny").css("display", "none");
        };
    });

    var object_list = {
        '#doctor': "ПІБ лікаря",
        '#department': "Оберіть відділення",
        '#diagnosis_type': "Оберіть клас діагнозу",
        '#diagnosis': "Оберіть діагноз"
    };

    for (obj in object_list) {
        $(obj).select2({
            placeholder: object_list[obj],
            language: {
                errorLoading: function() {return "Неможливо завантажити результати"},
                loadingMore: function() {return"Завантаження інших результатів…"},
                noResults: function() {return"Нічого не знайдено"},
                searching: function() {return"Пошук…"}
            } 
    })};


    $(document).on('select2:open', () => {
        document.querySelector('.select2-search__field').focus();
    });


    $("#diagnosis_type").change(function() {
        var selected = $("#diagnosis_type").find(":selected").val();
        $("#diagnosis optgroup").attr("disabled", true);
        $(`#diagnosis optgroup[label="${selected}"]`).attr("disabled", false);

        if (selected != $("#diagnosis :selected").parent().attr('label')) {
            $('#diagnosis option[id="select2-data-8-1hlp"]').attr('selected');
            $("#select2-diagnosis-container").attr('title', 'Оберіть діагноз');
            $("#select2-diagnosis-container").text('Оберіть діагноз');
        };
    });

    window.onload = function go() {
        if ($("#id_type_patient").find(":selected").val() == 1) {
            console.log(6);
            $("#planovy1").css("display", "flex");
            $("#planovy2").css("display", "flex");
            $("#urgentny").css("display", "none");
        } else if ($("#id_type_patient").find(":selected").val() == 2) {
            $("#urgentny").css("display", "flex");
            $("#planovy1").css("display", "none");
            $("#planovy2").css("display", "none");
        } else {
            $("#planovy1").css("display", "none");
            $("#planovy2").css("display", "none");
            $("#urgentny").css("display", "none");
        };
        };
    

    $('tr[data-href]').on("click", function() {
        document.location = $(this).data('href');
    });
});
