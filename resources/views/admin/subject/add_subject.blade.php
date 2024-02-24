<div class="eoff-form">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.create.subject') }}">
         @csrf 
        <div class="form-row">
            <div class="fpb-7">
                <label for="class_id_on_create" class="eForm-label">{{ get_phrase('Chuyên mục') }}</label>
                <select name="category_id" id="category_id" class="form-select eForm-select eChoice-multiple-with-remove" required>
                    <option value="">{{ get_phrase('Lựa chọn chuyên mục') }}</option>
                     @foreach($categories as $category)
                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                    @endforeach
                </select>
            </div>
            
            <div class="fpb-7">
                <label for="name" class="eForm-label">{{ get_phrase('Tên lớp') }}</label>
                <input type="text" class="form-control eForm-control" id="name" name = "name" placeholder="Nhập tên lớp" required>
            </div>

            <div class="fpb-7 pt-2">
                <button class="btn-form" type="submit">{{ get_phrase('Tạo lớp') }}</button>
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