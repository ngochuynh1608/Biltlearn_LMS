<div class="eoff-form">
    <form method="POST" enctype="multipart/form-data"  action="{{ route('admin.offline_admission.enrol_student') }}" class="d-block ajaxForm">
        @csrf 
        <input type="hidden" name="class_id" value=" {{ $class->id }}">
        <div class="input-group me-2 mb-2">
            <textarea class="form-control" name="ids" rows="10">
            </textarea>
        </div>
        <div>
            <h3>Nhập danh sách mã học viên, mỗi mã nằm trên 1 dòng</h3>
        </div>

        <div class="row no-gutters">
            <div class="form-group  col-md-12 p-0 mt-2">
                <button class="eBtn eBtn btn-primary ms-2" type="submit">{{ get_phrase('Ghi danh') }}</button>
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">
  
    "use strict";

    var form;
    $(".ajaxForm").submit(function(e) {
      form = $(this);
      ajaxSubmit(e, form, refreshForm);
    });
    var refreshForm = function () {
        form.trigger("reset");
    }
</script>
