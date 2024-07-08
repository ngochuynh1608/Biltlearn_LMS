<form method="POST" class="col-md-12 ajaxForm" action="{{ route('admin.offline_admission.excel_create') }}" id = "student_admission_form" enctype="multipart/form-data">
    @csrf 
    <div class="row justify-content-md-center">
        <div class="row mt-4">
            <div class="col-xl-2"></div>
            <div class="col-xl-4 p-1">
                <div class="col-12">
                    <a href="{{ asset('public/assets/csv_file/student.generate.csv') }}" class="btn btn-success btn-sm" download>Mâu csv <i class="bi bi-download"></i> </a>
                    <button href="#" class="btn btn-dark bi bi-eye" onclick="largeModal('{{ route('admin.offline_admission.preview') }}', 'CSV Format');" data-toggle="tooltip" data-placement="top" title="" data-original-title="{{ 'Preview csv format' }}"></button>

                </div>
            </div>
            <br>
        </div>
        <div class="col-md-8 mt-4">
            <div class="form-group">
                <label class="eForm-label">{{ 'Tải lên tệp' }}</label>
                <div class="custom-file-upload">
                    <input type="file" id="csv_file" class="form-control eForm-control-file" name="csv_file" required>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center">
        <button type="submit" class="btn btn-secondary col-md-4 col-sm-12 mb-4 mt-3">{{ get_phrase('Thêm học viên') }}</button>
    </div>
</form>

<script type="text/javascript">
  
    "use strict";
    
    $(document).ready(function(){
        initCustomFileUploader();
    });

    var form;
    $(".ajaxForm").submit(function(e) {
      form = $(this);
      ajaxSubmit(e, form, refreshForm);
    });
    var refreshForm = function () {
        form.trigger("reset");
    }
</script>
