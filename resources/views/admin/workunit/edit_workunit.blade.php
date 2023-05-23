<div class="eoff-form">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.edit.workunit',['id' => $workunit->id]) }}">
        @csrf 
        <div class="form-row">
            <div class="fpb-7">
                <label for="name" class="eForm-label">{{ get_phrase('Tên đơn vị') }}</label>
                <input type="text" class="form-control eForm-control" id="name" name="name" value="{{$workunit->name}}" required>
            </div>
            <div class="fpb-7 pt-2">
                <button class="btn-form" type="submit">{{ get_phrase('Cập nhật') }}</button>
            </div>
        </div>
    </form>
</div>