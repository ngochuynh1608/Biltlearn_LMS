<div class="eoff-form">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="<?php echo e(route('admin.create.class')); ?>">
        <?php echo csrf_field(); ?> 
        <div class="form-row">
            <div class="fpb-7">
                <label for="code" class="eForm-label"><?php echo e(get_phrase('Mã lớp')); ?></label>
                <input type="text" class="form-control eForm-control" id="code" name="code" required>
            </div>
            <div class="fpb-7">
                <label for="name" class="eForm-label"><?php echo e(get_phrase('Tên lớp học')); ?></label>
                <input type="text" class="form-control eForm-control" id="name" name="name" required>
            </div>
            <div class="fpb-7">
                <label for="subject" class="eForm-label"><?php echo e(get_phrase('Khóa học')); ?></label>
                <select name="subject_id" id = "subject_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove"  required>
                    <option value=""><?php echo e(get_phrase('Chọn khóa học')); ?></option>
                    <?php foreach($subjects as $subject): ?>
                        <option value="<?php echo e($subject['id']); ?>"><?php echo e($subject->name); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="fpb-7">
                <label for="date" class="eForm-label"><?php echo e(get_phrase('Thời gian bắt đầu')); ?></label>
                <input type="text" class="form-control eForm-control inputDate" id="date" name = "start_date" value="<?php echo e(date('d-m-y')); ?>">
            </div>
            <div class="fpb-7">
                <label for="date" class="eForm-label"><?php echo e(get_phrase('Thời gian kết thúc')); ?></label>
                <input type="text" class="form-control eForm-control inputDate" id="date" name = "end_date" value="<?php echo e(date('d-m-y')); ?>">
            </div>
            <div class="fpb-7">
                <label for="class_room" class="eForm-label"><?php echo e(get_phrase('Địa điểm')); ?></label>
                <select name="class_room_id" id = "class_room_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove">
                    <option value=""><?php echo e(get_phrase('Select subject')); ?></option>
                    <?php foreach($class_rooms as $class_room): ?>
                        <option value="<?php echo e($class_room['id']); ?>"><?php echo e($class_room->name); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="fpb-7">
                <label for="time_hours" class="eForm-label"><?php echo e(get_phrase('Thời lượng (số giờ học)')); ?></label>
                <input type="text" class="form-control eForm-control" id="time_hours" name = "time_hours" value="">
            </div>
            <div class="fpb-7">
                <label for="department" class="eForm-label"><?php echo e(get_phrase('Đối tượng')); ?></label>
                <select name="department_id" id = "department_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove" >
                    <option value=""><?php echo e(get_phrase('Lựa chọn đối tượng đào tạo')); ?></option>
                    <?php foreach($departments as $department): ?>
                        <option value="<?php echo e($department['id']); ?>"><?php echo e($department->name); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="fpb-7">
                <label for="teacher" class="eForm-label"><?php echo e(get_phrase('Giảng viên')); ?></label>
                <select name="teacher_id" id = "teacher_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove" >
                    <option value=""><?php echo e(get_phrase('Lựa chọn giảng viên')); ?></option>
                    <?php foreach($teachers as $teacher): ?>
                        <option value="<?php echo e($teacher['id']); ?>"><?php echo e($teacher->name); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
            <div class="fpb-7 pt-2">
                <button class="btn-form" type="submit"><?php echo e(get_phrase('Tạo lớp')); ?></button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">

    "use strict";

    $(document).ready(function () {
      $(".eChoice-multiple-with-remove").select2();
    });

    $(function () {
      $('.inputDate').daterangepicker(
        {
          singleDatePicker: true,
          showDropdowns: true,
          minYear: 2000,
          maxYear: parseInt(moment().format("YYYY"), 10),
          locale: {
            format: 'DD-MM-YYYY'
            },
        },
        function (start, end, label) {
          var years = moment().diff(start, "years");
        }
      );
    });

</script>

<?php /**PATH /Applications/XAMPP/xamppfiles/htdocs/ekattor8/resources/views/admin/class/add_class.blade.php ENDPATH**/ ?>