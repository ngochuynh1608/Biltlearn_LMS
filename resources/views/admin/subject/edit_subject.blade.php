<div class="eoff-form">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.subject.update', ['id' => $subject->id]) }}">
        @csrf 
        <div class="form-row">

            <div class="fpb-7">
                <label for="class_id_on_create" class="eForm-label">{{ get_phrase('Khóa học') }}</label>
                <select name="category_id" id="category_id" class="form-select eForm-select eChoice-multiple-with-remove" required>
                    <option value="">{{ get_phrase('Chọn chuyên mục') }}</option>
                        @foreach($categories as $category)
                            <option value="{{ $category->id }}" {{ $category->id == $subject->category_id ? 'selected':'' }}>{{ $category->name }}</option>
                        @endforeach
                </select>
            </div>

            <div class="fpb-7">
                <label for="name" class="eForm-label">{{ get_phrase('Tên lớp') }}</label>
                <input type="text" class="form-control eForm-control" value="{{ $subject->name }}" id="name" name = "name" required>
            </div>

            <div class="fpb-7 pt-2">
                <button class="btn-form" type="submit">{{ get_phrase('Cập nhật') }}</button>
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