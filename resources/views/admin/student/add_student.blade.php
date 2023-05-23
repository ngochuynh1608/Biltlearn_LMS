<div class="eoff-form">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.student.create') }}">
        @csrf 
        <div class="form-row">
            <div class="fpb-7">
                <label for="name" class="eForm-label">{{ get_phrase('Tên đầy đủ') }}</label>
                <input type="text" class="form-control eForm-control" id="name" name = "name" required>
            </div>

            <div class="fpb-7">
                <label for="email" class="eForm-label">{{ get_phrase('Email') }}</label>
                <input type="email" class="form-control eForm-control" id="email" name = "email" required>
            </div>

            <div class="fpb-7">
                <label for="department_id" class="eForm-label">{{ get_phrase('Đơn vị') }}</label>
                <select name="department_id" id = "department_id_on_routine_creation" class="form-select eForm-select eChoice-multiple-with-remove"  required>
                    <option value="">{{ get_phrase('Select a class room') }}</option>
                    <?php foreach($class_rooms as $class_room): ?>
                        <option value="{{ $class_room['id'] }}">{{ $class_room['name'] }}</option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="fpb-7">
                <label for="phone" class="eForm-label">{{ get_phrase('Phone number') }}</label>
                <input type="text" class="form-control eForm-control" id="phone" name = "phone">
            </div>

            <div class="fpb-7">
                <label for="password" class="eForm-label">{{ get_phrase('Password') }}</label>
                <input type="password" class="form-control eForm-control" id="password" name = "password">
            </div>

            <div class="fpb-7">
                <label for="phone" class="eForm-label">{{ get_phrase('Address') }}</label>
                <textarea class="form-control eForm-control" id="address" name = "address" rows="5" required></textarea>
            </div>


            <div class="fpb-7">
                <label for="class_id" class="eForm-label">{{ get_phrase("Lớp học") }}</label>
                <select name="class_id" id="class_id" class="form-select eForm-select eChoice-multiple-with-remove" onchange="classWiseSection(this.value)">
                    <option value="">{{ get_phrase("Select a class") }}</option>
                    @foreach($classes as $class)
                        <option value="{{ $class->id }}">{{ $class->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="fpb-7">
                <label for="section_id"  class="eForm-label">{{ get_phrase("Nhóm học viên") }}</label>
                <select name="section_id" id="section_id" class="form-select eForm-select eChoice-multiple-with-remove" >
                    <option value="">{{ get_phrase("First select a class") }}</option>
                </select>
            </div>

            <!--<div class="fpb-7">
                <label for="birthdatepicker" class="eForm-label">{{ get_phrase('Birthday') }}<span class="required"></span></label>
                <input type="text" class="form-control eForm-control" id="eInputDate" name="birthday" value="{{ date('m/d/Y') }}" />
            </div>-->

            <!--<div class="fpb-7">
                <label for="gender" class="eForm-label">{{ get_phrase('Gender') }}</label>
                <select name="gender" id="gender" class="form-select eForm-select eChoice-multiple-with-remove"  required>
                    <option value="">{{ get_phrase('Select gender') }}</option>
                    <option value="Male">{{ get_phrase('Male') }}</option>
                    <option value="Female">{{ get_phrase('Female') }}</option>
                    <option value="Others">{{ get_phrase('Others') }}</option>
                </select>
            </div>-->

            <!--<div class="fpb-7">
                <label for="blood_group" class="eForm-label">{{ get_phrase('Blood group') }}</label>
                <select name="blood_group" id="blood_group" class="form-select eForm-select eChoice-multiple-with-remove">
                    <option value="">{{ get_phrase('Select a blood group') }}</option>
                    <option value="a+">{{ get_phrase('A+') }}</option>
                    <option value="a-">{{ get_phrase('A-') }}</option>
                    <option value="b+">{{ get_phrase('B+') }}</option>
                    <option value="b-">{{ get_phrase('B-') }}</option>
                    <option value="ab+">{{ get_phrase('AB+') }}</option>
                    <option value="ab-">{{ get_phrase('AB-') }}</option>
                    <option value="o+">{{ get_phrase('O+') }}</option>
                    <option value="o-">{{ get_phrase('O-') }}</option>
                </select>
            </div>-->

            <div class="fpb-7">
              <label for="formFile" class="eForm-label"
                >{{ get_phrase('Photo') }}</label
              >
              <input
                class="form-control eForm-control-file"
                id="photo" name="photo" accept="image/*"
                type="file"
              />
            </div>

            <div class="fpb-7 pt-2">
                <button class="btn-form" type="submit">{{ get_phrase('Create') }}</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">

    "use strict";

    $(document).ready(function () {
      $(".eChoice-multiple-with-remove").select2();
    });

    function classWiseSection(classId) {
        let url = "{{ route('class_wise_sections', ['id' => ":classId"]) }}";
        url = url.replace(":classId", classId);
        $.ajax({
            url: url,
            success: function(response){
                $('#section_id').html(response);
            }
        });
    }

    $(function () {
      $('input[name="birthday"]').daterangepicker(
        {
          singleDatePicker: true,
          showDropdowns: true,
          minYear: 1901,
          maxYear: parseInt(moment().format("YYYY"), 10),
        },
        function (start, end, label) {
          var years = moment().diff(start, "years");
        }
      );
    });

</script>