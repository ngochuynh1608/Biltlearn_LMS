<div class="eoff-form">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm">
        @csrf 
        <div class="input-group me-2 mb-2">
                <input type="hidden" class="form-control eForm-control" id="" name = "section_id[]" value="">
                <input type="text" placeholder="{{ get_phrase('Vui lòng nhập email hoặc mã nhân viên') }}" class="form-control eForm-control" id="name" name = "name[]" value="" required>
                <button class="btn btn-icon btn-success" type="button" onclick="appendSection()"><i class="bi bi-plus"></i></button>
        </div>
        <div id = "section_area"></div>

        <div class="row">
        <div class="col-md-12 p-0 mt-2">
            <a class="" onclick="appendSection()" type="submit">+{{ get_phrase('Thêm dòng') }}</a>
        </div>
        <div class="row no-gutters">
        <div class="form-group  col-md-12 p-0 mt-2">
            <button class="eBtn eBtn btn-primary ms-2" type="submit">{{ get_phrase('Hoàn thành') }}</button>
        </div>
    </div>
    </form>
</div>

<div id = "blank_section" class="d-hidden">
    <div class="input-group me-2 mb-2">

            <input type="hidden" class="form-control eForm-control" name = "section_id[]" value="0">
            <input type="text" placeholder="{{ get_phrase('Vui lòng nhập email hoặc mã nhân viên') }}" class="form-control eForm-control" name = "name[]" value="" required>

            <button class="btn btn-icon btn-danger" type="button" onclick="removeSection(this)"><i class="bi bi-dash"></i></button>
    </div>
</div>


<script type="text/javascript">
  
    "use strict";

    var blank_section_field = $('#blank_section').html();


    function appendSection() {
        $('#section_area').append(blank_section_field);
    }

    function removeSection(elem) {
        $(elem).closest('.input-group').remove();
    }

    function removeSectionDatabase(section_id) {
        $('#sectionDatabase'+section_id).hide();
        $('#section'+section_id).val(section_id+'delete');
    }
</script>
