<form method="POST" class="col-md-12 ajaxForm" action="<?php echo e(route('admin.offline_admission.bulk_create')); ?>" id = "student_admission_form" enctype="multipart/form-data">
    <?php echo csrf_field(); ?> 
    <div class="row justify-content-md-center">
        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 mb-3 mb-lg-0">
            <select name="class_id" id="class_id" class="form-select eForm-select eChoice-multiple-with-remove" onchange="classWiseSection(this.value)" required>
                <option value=""><?php echo e(get_phrase('Select a class')); ?></option>
                <?php $__currentLoopData = $data['classes']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $class): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($class->id); ?>"><?php echo e($class->name); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
        </div>
        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 mb-3 mb-lg-0" id = "section_content">
            <select name="section_id" id="section_id" class="form-select eForm-select eChoice-multiple-with-remove" required >
                <option value=""><?php echo e(get_phrase('Select section')); ?></option>
            </select>
        </div>
        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 mb-3 mb-lg-0">
            <select name="department_id" id="department_id" class="form-select eForm-select eChoice-multiple-with-remove" required>
                <option value=""><?php echo e(get_phrase('Select a department')); ?></option>
                <?php $__currentLoopData = $data['departments']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $department): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($department->id); ?>"><?php echo e($department->name); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
        </div>
    </div>
    <br>
    <div id = "first-row">
        <div class="row">
            <div class="col-xl-11 col-lg-11 col-md-12 col-sm-12 mb-3 mb-lg-0">
                <div class="row justify-content-md-center">
                    <div class="form-group col-xl-2 col-lg-2 col-md-12 col-sm-12 mb-1 mb-lg-0">
                        <input type="text" name="name[]" class="form-control eForm-control"  value="" placeholder="Name" required>
                    </div>
                    <div class="form-group col-xl-2 col-lg-2 col-md-12 col-sm-12 mb-1 mb-lg-0">
                        <input type="email" name="email[]" class="form-control eForm-control"  value="" placeholder="Email" required>
                    </div>
                    <div class="form-group col-xl-2 col-lg-2 col-md-12 col-sm-12 mb-1 mb-lg-0">
                        <input type="password" name="password[]" class="form-control eForm-control"  value="" placeholder="Password" required>
                    </div>
                    <div class="form-group col-xl-2 col-lg-2 col-md-12 col-sm-12 mb-1 mb-lg-0">
                        <select name="gender[]" class="form-select eForm-select eChoice-multiple-with-remove" required>
                            <option value=""><?php echo e(get_phrase('Select gender')); ?></option>
                            <option value="Male"><?php echo e(get_phrase('Male')); ?></option>
                            <option value="Female"><?php echo e(get_phrase('Female')); ?></option>
                            <option value="Others"><?php echo e(get_phrase('Others')); ?></option>
                        </select>
                    </div>

                    <div class="form-group col-xl-2 col-lg-2 col-md-12 col-sm-12 mb-1 mb-lg-0">
                        <select name="parent_id[]" class="form-select eForm-select eChoice-multiple-with-remove" required>
                            <option value=""><?php echo e(get_phrase('Select a parent')); ?></option>
                            <?php $__currentLoopData = $data['parents']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $parent): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($parent->id); ?>"><?php echo e($parent->name); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    
                </div>
            </div>
            <div class="col-xl-1 col-lg-1 col-md-12 col-sm-12 mb-3 mb-lg-0">
                <div class="row justify-content-md-center">
                    <div class="form-group col">
                        <button type="button" class="btn btn-icon btn-success" onclick="appendRow()"> <i class="bi bi-plus"></i> </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center">
        <button type="submit" class="btn btn-secondary col-md-4 col-sm-12 mb-4 mt-2"><?php echo e(get_phrase('Add students')); ?></button>
    </div>
</form>

<div class="display-none-view" id = "blank-row ">
    <div class="row student-row pt-3">
        <div class="col-xl-11 col-lg-11 col-md-12 col-sm-12 mb-3 mb-lg-0">
            <div class="row justify-content-md-center">
                <div class="form-group col-xl-2 col-lg-2 col-md-12 col-sm-12 mb-1 mb-lg-0">
                    <input type="text" name="name[]" class="form-control eForm-control"  value="">
                </div>
                <div class="form-group col-xl-2 col-lg-2 col-md-12 col-sm-12 mb-1 mb-lg-0">
                    <input type="email" name="email[]" class="form-control eForm-control"  value="">
                </div>
                <div class="form-group col-xl-2 col-lg-2 col-md-12 col-sm-12 mb-1 mb-lg-0">
                    <input type="password" name="password[]" class="form-control eForm-control"  value="" placeholder="Password">
                </div>

                <div class="form-group col-xl-2 col-lg-2 col-md-12 col-sm-12 mb-1 mb-lg-0">
                    <select name="gender[]" class="form-control eForm-control">
                        <option value=""><?php echo e(get_phrase('Select gender')); ?></option>
                        <option value="Male"><?php echo e(get_phrase('Male')); ?></option>
                        <option value="Female"><?php echo e(get_phrase('Female')); ?></option>
                        <option value="Others"><?php echo e(get_phrase('Others')); ?></option>
                    </select>
                </div>

                <div class="form-group col-xl-2 col-lg-2 col-md-12 col-sm-12 mb-1 mb-lg-0">
                    <select name="parent_id[]" class="form-control eForm-control" required>
                        <option value=""><?php echo e(get_phrase('Select a parent')); ?></option>
                        <?php $__currentLoopData = $data['parents']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $parent): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($parent->id); ?>"><?php echo e($parent->name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-xl-1 col-lg-1 col-md-12 col-sm-12 mb-3 mb-lg-0">
            <div class="row justify-content-md-center">
                <div class="form-group col">
                    <button type="button" class="btn btn-icon btn-danger" onclick="removeRow(this)"> <i class="bi bi-x"></i> </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
  
    "use strict";
    
    var blank_field = $('#blank-row').html();

    function appendRow() {
        $('#first-row').append(blank_field);
    }

    function removeRow(elem) {
        $(elem).closest('.student-row').remove();
    }

    
    var form;
    $(".ajaxForm").submit(function(e) {
        form = $(this);
        ajaxSubmit(e, form, refreshForm);
    });
    var refreshForm = function () {
        form.trigger("reset");
    }
</script><?php /**PATH /Applications/XAMPP/xamppfiles/htdocs/ekattor8/resources/views/admin/offline_admission/bulk_student_admission.blade.php ENDPATH**/ ?>