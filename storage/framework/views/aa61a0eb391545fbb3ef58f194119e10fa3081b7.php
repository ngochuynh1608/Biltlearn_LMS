<form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="<?php echo e(route('admin.create.expenses')); ?>">
    <?php echo csrf_field(); ?> 
    <div class="form-row">
        <div class="fpb-7">
            <label for="date" class="eForm-label"><?php echo e(get_phrase('Ngày')); ?></label>
            <input type="text" class="form-control eForm-control inputDate" id="date" name = "date" value="<?php echo e(date('d-m-Y')); ?>" required>
        </div>
        
        <div class="fpb-7">
            <label for="amount" class="eForm-label"><?php echo e(get_phrase('Số tiền').' ('.school_currency().')'); ?></label>
            <input type="text" class="form-control eForm-control" id="amount" name = "amount" required>
        </div>

        <div class="fpb-7">
            <label for="expense_category_id" class="eForm-label"><?php echo e(get_phrase('Loại chi phí')); ?></label>
            <select class="form-select eForm-select eChoice-multiple-with-remove" name="expense_category_id" id = "expense_category_id_on_create" required>
                <option value=""><?php echo e(get_phrase('Chọn loại chi phí')); ?></option>
                <?php $__currentLoopData = $expense_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $expense_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($expense_category->id); ?>"><?php echo e($expense_category->name); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
        </div>

        <div class="fpb-7">
            <label for="class_category_id" class="eForm-label"><?php echo e(get_phrase('Lớp học')); ?></label>
            <select class="form-select eForm-select eChoice-multiple-with-remove" name="class_id" id = "class_id_on_create">
                <option value=""><?php echo e(get_phrase('Lựa chọn lớp học')); ?></option>
                <?php $__currentLoopData = $classes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $class): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($class->id); ?>"><?php echo e($class->name); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
        </div>

        <div class="fpb-7 pt-2">
            <button class="btn-form" type="submit"><?php echo e(get_phrase('Tạo chi phí')); ?></button>
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
            format: 'DD-MM-YYYY'
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

</script><?php /**PATH /Applications/XAMPP/xamppfiles/htdocs/ekattor8/resources/views/admin/expenses/create.blade.php ENDPATH**/ ?>