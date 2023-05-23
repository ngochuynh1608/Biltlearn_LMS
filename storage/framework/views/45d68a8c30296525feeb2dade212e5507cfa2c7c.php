<div class="eoff-form">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="<?php echo e(route('admin.create.workunit')); ?>">
        <?php echo csrf_field(); ?> 
        <div class="form-row">
            <div class="fpb-7">
                <label for="name" class="eForm-label"><?php echo e(get_phrase('Tên đơn vị')); ?></label>
                <input type="text" class="form-control eForm-control" id="name" name="name" required>
            </div>
            <div class="fpb-7 pt-2">
                <button class="btn-form" type="submit"><?php echo e(get_phrase('Tạo mới')); ?></button>
            </div>
        </div>
    </form>
</div><?php /**PATH /Applications/XAMPP/xamppfiles/htdocs/ekattor8/resources/views/admin/workunit/add_workunit.blade.php ENDPATH**/ ?>