<form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.create.expenses') }}">
    @csrf 
    <div class="form-row">
        <div class="fpb-7">
            <label for="date" class="eForm-label">{{ get_phrase('Ngày') }}</label>
            <input type="text" class="form-control eForm-control inputDate" id="date" name = "date" value="{{ date('d/m/Y') }}" required>
        </div>
        
        <div class="fpb-7">
            <label for="amount" class="eForm-label">{{ get_phrase('Số tiền').' ('.school_currency().')' }}</label>
            <input type="text" class="form-control eForm-control" id="amount" name = "amount" required>
        </div>

        <div class="fpb-7">
            <label for="expense_category_id" class="eForm-label">{{ get_phrase('Loại chi phí') }}</label>
            <select class="form-select eForm-select eChoice-multiple-with-remove" name="expense_category_id" id = "expense_category_id_on_create" required>
                <option value="">{{ get_phrase('Chọn loại chi phí') }}</option>
                @foreach ($expense_categories as $expense_category)
                    <option value="{{ $expense_category->id }}">{{ $expense_category->name }}</option>
                @endforeach
            </select>
        </div>

        <div class="fpb-7">
            <label for="class_category_id" class="eForm-label">{{ get_phrase('Lớp học') }}</label>
            <select class="form-select eForm-select eChoice-multiple-with-remove" name="class_id" id = "class_id_on_create">
                <option value="">{{ get_phrase('Lựa chọn lớp học') }}</option>
                @foreach ($classes as $class)
                    <option value="{{ $class->id }}">{{ $class->name }}</option>
                @endforeach
            </select>
        </div>

        <div class="fpb-7 pt-2">
            <button class="btn-form" type="submit">{{ get_phrase('Tạo chi phí') }}</button>
        </div>

    </div>
</form>

<script type="text/javascript">

  "use strict";

    $(function () {
      $('.inputDate').daterangepicker(
        {
          singleDatePicker: true,
          showDropdowns: true,
          minYear: 2000,
          maxYear: parseInt(moment().format("YYYY"), 10),
          locale: {
            format: 'DD/MM/YYYY'
            },
        },
        function (start, end, label) {
          var years = moment().diff(start, "years");
        }
      );
    });

    $(document).ready(function () {
      $(".eChoice-multiple-with-remove").select2();
    });

</script>