<?php use App\Models\CategoriesSubject; ?>

@extends('admin.navigation')
   
@section('content')
<div class="mainSection-title">
    <div class="row">
      <div class="col-12">
        <div
          class="d-flex justify-content-between align-items-center flex-wrap gr-15"
        >
          <div class="d-flex flex-column">
            <h4>{{ get_phrase('Subjects') }}</h4>
            <ul class="d-flex align-items-center eBreadcrumb-2">
              <li><a href="#">{{ get_phrase('Home') }}</a></li>
              <li><a href="#">{{ get_phrase('Quản lý học tập') }}</a></li>
              <li><a href="#">{{ get_phrase('Khóa học') }}</a></li>
            </ul>
          </div>
          <div class="export-btn-area">
            <a href="javascript:;" class="export_btn" onclick="rightModal('{{ route('admin.subject.open_modal') }}', '{{ get_phrase('Tạo khóa học') }}')"><i class="bi bi-plus"></i>{{ get_phrase('Tạo khóa học') }}</a>
          </div>
        </div>
      </div>
    </div>
</div>
<div class="row">
    <div class="col-8 offset-md-2">
        <div class="eSection-wrap">
            <form method="GET" class="d-block ajaxForm" action="{{ route('admin.subject_list') }}">
                <div class="row mt-3">
                    <div class="col-md-4"></div>
                    <div class="col-md-3">
                        <select name="category_id" id="category_id" class="form-select eForm-select eChoice-multiple-with-remove" required onchange="classWiseSection(this.value)">
                            <option value="">{{ get_phrase('Lựa chọn chuyên mục') }}</option>
                            @foreach($categories as $category)
                                <option value="{{ $category->id }}" {{ $category_id == $category->id ?  'selected':'' }}>{{ $category->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-4">
                        <button class="eBtn eBtn btn-secondary" type="submit" id = "filter_routine">{{ get_phrase('Bộ lọc') }}</button>
                    </div>
                </div>
            </form>

            @if(count($subjects) > 0)
            <div class="table-responsive">
                <table class="table eTable">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>{{ get_phrase('Tên khóa học') }}</th>
                            <th>{{ get_phrase('Chuyên mục') }}</th>
                            <th class="text-end">{{ get_phrase('Hành động') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($subjects as $key => $subject)
                            <?php $category = CategoriesSubject::get()->where('id', $subject->category_id)->first(); ?>
                             <tr>
                                <td>{{ $subjects->firstItem() + $key }}</td>
                                <td>{{ $subject->name }}</td>
                                <td>{{ $category->name }}</td>
                                <td class="text-start">
                                    <div class="adminTable-action">
                                        <button
                                          type="button"
                                          class="eBtn eBtn-black dropdown-toggle table-action-btn-2"
                                          data-bs-toggle="dropdown"
                                          aria-expanded="false"
                                        >
                                          {{ get_phrase('Hành động') }}
                                        </button>
                                        <ul
                                          class="dropdown-menu dropdown-menu-end eDropdown-menu-2 eDropdown-table-action"
                                        >
                                          <li>
                                            <a class="dropdown-item" href="javascript:;" onclick="rightModal('{{ route('admin.edit.subject', ['id' => $subject->id]) }}', '{{ get_phrase('Chỉnh sửa') }}')">{{ get_phrase('Chỉnh sửa') }}</a>
                                          </li>
                                          <li>
                                            <a class="dropdown-item" href="javascript:;" onclick="confirmModal('{{ route('admin.subject.delete', ['id' => $subject->id]) }}', 'undefined');">{{ get_phrase('Xóa') }}</a>
                                          </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                {!! $subjects->appends(request()->all())->links() !!}
            </div>
            @else
            <div class="empty_box center">
              <img class="mb-3" width="150px" src="{{ asset('public/assets/images/empty_box.png') }}" />
              <br>
              <span class="">{{ get_phrase('No data found') }}</span>
            </div>
            @endif
        </div>
    </div>
</div>
@endsection