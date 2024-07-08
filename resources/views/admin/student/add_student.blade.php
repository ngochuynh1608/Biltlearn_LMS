<div class="eForm-layouts">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.offline_admission.create') }}">
        @csrf 

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="code"
                class="col-sm-2 col-eForm-label">{{ get_phrase('Mã nhân viên') }}</label>
            <div class="col-sm-10 col-md-9 col-lg-10">
                <input type="code" class="form-control eForm-control" id="code" name="code" required>
            </div>
        </div>

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="name" class="col-sm-2 col-eForm-label">{{ get_phrase('Tên đầy đủ') }}</label>
            <div class="col-sm-10 col-md-9 col-lg-10">
                <input type="text" class="form-control eForm-control" id="name" name="name" required>
            </div>
        </div>

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="email"
                class="col-sm-2 col-eForm-label">{{ get_phrase('Email') }}</label>
            <div class="col-sm-10 col-md-9 col-lg-10">
                <input type="email" class="form-control eForm-control" id="email" name="email" required>
            </div>
        </div>

        
        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="password"
                class="col-sm-2 col-eForm-label">{{ get_phrase('Mật khẩu') }}</label>
            <div class="col-sm-10 col-md-9 col-lg-10">
                <input type="password" class="form-control eForm-control" id="password" name="password">
            </div>
        </div>

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="birthdatepicker" class="col-sm-2 col-eForm-label">{{ get_phrase('Bắt đầu làm việc') }}<span class="required"></span></label>
            <div class="col-md-10">
                <input type="text" class="form-control eForm-control" id="eInputDate" name="eDefaultDateRange" value="{{ date('m/d/Y') }}" />
            </div>
        </div>

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="phone" class="col-sm-2 col-eForm-label">{{ get_phrase('Số điện thoại') }}</label>
            <div class="col-md-10">
                <input type="text" id="phone" name="phone" class="form-control eForm-control">
            </div>
        </div>

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="address" class="col-sm-2 col-eForm-label">{{ get_phrase('Địa chỉ') }}</label>
            <div class="col-md-10">
                <textarea class="form-control eForm-control" id="address" rows="4" name = "address"></textarea>
            </div>
        </div>



        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="photo" class="col-sm-2 col-eForm-label">{{ get_phrase('Ảnh đại diện') }}</label>
            <div class="col-md-10">
                <input class="form-control eForm-control-file" type="file" id="photo" name="photo" accept="image/*">
            </div>
        </div>

        <div class="row">
            <div class="col-sm-10 offset-sm-2">
                <button type="submit" class="btn-form">{{ get_phrase('Thêm học viên') }}</button>
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">

    "use strict";

    $(document).ready(function () {
      $(".eChoice-multiple-with-remove").select2();
    });

</script>