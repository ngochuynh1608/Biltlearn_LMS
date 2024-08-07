@extends('admin.navigation')
   
@section('content')

<?php 

use App\Http\Controllers\CommonController;
use App\Models\School;
use App\Models\Section;

?>

<div class="mainSection-title">
    <div class="row">
      <div class="col-12">
        <div
          class="d-flex justify-content-between align-items-center flex-wrap gr-15"
        >
          <div class="d-flex flex-column">
            <h4>{{ get_phrase('Học viên') }}</h4>
            <ul class="d-flex align-items-center eBreadcrumb-2">
              <li><a href="#">{{ get_phrase('Bảng điều khiển') }}</a></li>
              <li><a href="#">{{ get_phrase('Nhân sự') }}</a></li>
              <li><a href="#">{{ get_phrase('Học viên') }}</a></li>
            </ul>
          </div>
          <div class="export-btn-area">
            <a href="{{ route('admin.offline_admission.single', ['type' => 'single']) }}" class="export_btn">{{ get_phrase('Tạo học viên') }}</a>
          </div>
        </div>
      </div>
    </div>
</div>
<!-- Start Students area -->
<div class="row">
    <div class="col-12">
        <div class="eSection-wrap-2">
          <!-- Search and filter -->
            <div
              class="search-filter-area d-flex justify-content-md-between justify-content-center align-items-center flex-wrap gr-15"
            >
              <form action="{{ route('admin.student') }}">
                <div
                  class="search-input d-flex justify-content-start align-items-center"
                >
                  <span>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      viewBox="0 0 16 16"
                    >
                      <path
                        id="Search_icon"
                        data-name="Search icon"
                        d="M2,7A4.951,4.951,0,0,1,7,2a4.951,4.951,0,0,1,5,5,4.951,4.951,0,0,1-5,5A4.951,4.951,0,0,1,2,7Zm12.3,8.7a.99.99,0,0,0,1.4-1.4l-3.1-3.1A6.847,6.847,0,0,0,14,7,6.957,6.957,0,0,0,7,0,6.957,6.957,0,0,0,0,7a6.957,6.957,0,0,0,7,7,6.847,6.847,0,0,0,4.2-1.4Z"
                        fill="#797c8b"
                      />
                    </svg>
                  </span>
                  <input
                    type="text"
                    id="search"
                    name="search"
                    value="{{ $search }}"
                    placeholder="Tìm kiếm học viên"
                    class="form-control"
                  />
                  @if($class_id != '')
                  <input type="hidden" name="class_id" id="class_id" value="{{ $class_id }}">
                  @endif
                  @if($section_id != '')
                  <input type="hidden" name="section_id" id="section_id" value="{{ $section_id }}">
                  @endif
                </div>
              </form>
              <div class="filter-export-area d-flex align-items-center">
                <div class="position-relative">
                  <button
                    class="eBtn-3 dropdown-toggle"
                    type="button"
                    id="defaultDropdown"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="true"
                    aria-expanded="false"
                  >
                    <span class="pr-10">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="14.028"
                        height="12.276"
                        viewBox="0 0 14.028 12.276"
                      >
                        <path
                          id="filter-solid"
                          d="M.106,32.627A1.1,1.1,0,0,1,1.1,32H12.934a1.092,1.092,0,0,1,.989.627,1.054,1.054,0,0,1-.164,1.164l-4.99,6.126V43.4a.877.877,0,0,1-1.4.7L5.612,42.786a.871.871,0,0,1-.351-.7V39.917L.248,33.79a1.1,1.1,0,0,1-.142-1.164Z"
                          transform="translate(0 -32)"
                          fill="#00a3ff"
                        />
                      </svg>
                    </span>
                    {{ get_phrase('Lọc') }}
                  </button>
                  <div
                    class="dropdown-menu dropdown-menu-end filter-options"
                    aria-labelledby="defaultDropdown"
                  >
                    <h4 class="title">{{ get_phrase('Bộ lọc') }}</h4>
                    <form action="{{ route('admin.student') }}">
                      <div class="filter-option d-flex flex-column">
                        @if($search != '')
                        <input type="hidden" name="search" id="search" value="{{ $search }}">
                        @endif
                        <div>
                          <label for="class_id" class="eForm-label"
                            >{{ get_phrase('Class') }}</label
                          >
                          <select
                            class="form-select" name="class_id"
                            id="class_id" onchange="classWiseSection(this.value)" required
                          >
                            <option value="">{{ get_phrase('Select a class') }}</option>
                            @foreach($classes as $class)
                                <option value="{{ $class->id }}" {{ $class_id == $class->id ?  'selected':'' }}>{{ $class->name }}</option>
                            @endforeach
                          </select>
                        </div>
                        <div>
                          <label for="section_id" class="eForm-label"
                            >{{ get_phrase('Section') }}</label
                          >
                          <select
                            class="form-select"
                            name="section_id" id="section_id"
                            data-placeholder="Type to search..."
                          >
                            <?php if($class_id !=""){
                                $sections = Section::get()->where('class_id', $class_id); ?>
                                @foreach($sections as $section)
                                    <option value="{{ $section->id }}" {{ $section_id == $section->id ?  'selected':'' }}>{{ $section->name }}</option>
                                @endforeach
                            <?php } else { ?>
                                <option value="">{{ get_phrase('First select a class') }}</option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <div
                        class="filter-button d-flex justify-content-end align-items-center"
                      >
                        <a class="form-group">
                          <button class="eBtn eBtn btn-primary" type="submit">{{ get_phrase('Apply') }}</button>
                        </a>
                      </div>
                    </form>
                  </div>
                </div>
                <!-- Export Button -->
                @if(count($students) > 0)
                <div class="position-relative">
                  <button
                    class="eBtn-3 dropdown-toggle"
                    type="button"
                    id="defaultDropdown"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="true"
                    aria-expanded="false"
                  >
                    <span class="pr-10">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="12.31"
                        height="10.77"
                        viewBox="0 0 10.771 12.31"
                      >
                        <path
                          id="arrow-right-from-bracket-solid"
                          d="M3.847,1.539H2.308a.769.769,0,0,0-.769.769V8.463a.769.769,0,0,0,.769.769H3.847a.769.769,0,0,1,0,1.539H2.308A2.308,2.308,0,0,1,0,8.463V2.308A2.308,2.308,0,0,1,2.308,0H3.847a.769.769,0,1,1,0,1.539Zm8.237,4.39L9.007,9.007A.769.769,0,0,1,7.919,7.919L9.685,6.155H4.616a.769.769,0,0,1,0-1.539H9.685L7.92,2.852A.769.769,0,0,1,9.008,1.764l3.078,3.078A.77.77,0,0,1,12.084,5.929Z"
                          transform="translate(0 12.31) rotate(-90)"
                          fill="#00a3ff"
                        />
                      </svg>
                    </span>
                    {{ get_phrase('Export') }}
                  </button>
                  <ul
                    class="dropdown-menu dropdown-menu-end eDropdown-menu-2"
                  >
                    <li>
                        <a class="dropdown-item" id="pdf" href="javascript:;" onclick="Export()">{{ get_phrase('PDF') }}</a>
                    </li>
                    <li>
                        <a class="dropdown-item" id="print" href="javascript:;" onclick="printableDiv('student_list')">{{ get_phrase('Print') }}</a>
                    </li>
                  </ul>
                </div>
                @endif
              </div>
            </div>
            @if(count($students) > 0)
            <!-- Table -->
            <div class="table-responsive">
              <table class="table eTable" style="display: block;
                max-width: -moz-fit-content;
                max-width: fit-content;
                margin: 0 auto;
                overflow-x: auto;
                white-space: nowrap;">
                <thead style="font-weight: 900;">
                  <tr>
                    <th scope="col"><input type="checkbox" /></th>
                    <th scope="col">STT</th>
                    <th scope="col">{{ get_phrase('Đơn vị') }}</th>
                    <th scope="col">{{ get_phrase('Phòng ban') }}</th>
                    <th scope="col">{{ get_phrase('Mã học viên') }}</th>
                    <th scope="col">{{ get_phrase('Tên học viên') }}</th>
                    <th scope="col">{{ get_phrase('Bắt đầu làm việc') }}</th>
                    <th scope="col" style="background: #ebff00;">{{ get_phrase('Số chỉ tiêu đào tạo (giờ )') }}</th>
                    <th scope="col">{{ get_phrase('Số giờ đã đào tạo') }}</th>
                    <th scope="col">{{ get_phrase('Tỉ lệ hoàn thành đào tạo') }}</th>
                    <th scope="col" style="background: #ebff00;">{{ get_phrase('Số chỉ tiêu giảng dạy (giờ)') }}</th>
                    <th scope="col">{{ get_phrase('Số giờ đã giảng dạy') }}</th>
                    <th scope="col">{{ get_phrase('Tỉ lệ hoàn thành giảng dạy') }}</th>
                    <th scope="col">{{ get_phrase('Hành động') }}</th>
                </thead>
                <tbody>
                    @foreach($students as $key => $user)
                    <?php 
                        $student = DB::table('users')->where('id', $user->id)->first();

                        $user_image = get_user_image($user->id);
                        $info = json_decode($user->user_information);

                        $student_details = (new CommonController)->get_student_academic_info($user->id);
                    ?>

                      <tr>
                        <td scope="row" ><input type="checkbox" /></td>
                        <td>
                          <p class="row-number">{{ $students->firstItem() + $key }}</p>
                        </td>
                        <td>
                          <div class="dAdmin_info_name">
                            <p>{{ $user->workunit }}
                            </p>
                          </div>

                        </td>
                        <td>
                          <div class="dAdmin_info_name">
                          <p>
                              {{ $user->department }}
                          </p>
                        </div>
                        </td>
                        <td>
                          <div class="dAdmin_info_name">
                            <p>{{ $user->code }}</p>
                          </div>
                        </td>
                        <td>
                          <div
                            class="dAdmin_profile d-flex align-items-center min-w-200px"
                          >
                            <div class="dAdmin_profile_img">
                              <img
                                class="img-fluid"
                                width="50"
                                height="50"
                                src="{{ $user_image }}"
                              />
                            </div>
                            <div class="dAdmin_info_name">
                              <p>{{ $student->name }}</p>
                            </div>
                          </div>
                        </td>
                        <td>
                          <div class="dAdmin_info_name">
                            @if($student->workstartdate  != null)
                              <p>{{ date('d/m/Y') }}</p>
                            @endif
                          </div>
                        </td>
                        <td>
                          <div class="dAdmin_info_name">
                            50
                          </div>
                        </td>
                        <td>
                          <div class="dAdmin_info_name">
                            10.5
                          </div>
                        </td>
                        <td>
                          <div class="dAdmin_info_name">
                            <?php  $progress = rand(0,100); ?>
                            <div class="progress">
                              <div class="progress-bar" style="width: {{ $progress }}%" role="progressbar" aria-valuenow="{{ $progress }}" aria-valuemin="0" aria-valuemax="100">{{ $progress }} %</div>
                            </div>
                          </div>
                        </td>
                        <td>
                          <div class="dAdmin_info_name">
                            0
                          </div>
                        </td>
                        <td>
                          <div class="dAdmin_info_name">
0
                          </div>
                        </td>
                        <td>
                          <div class="dAdmin_info_name">
0
                          </div>
                        </td>
                        <td>
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
                                <a class="dropdown-item" href="javascript:;" onclick="rightModal('{{ route('admin.student_edit_modal', ['id' => $student->id]) }}', 'Edit Student')">{{ get_phrase('Chỉnh sửa') }}</a>
                              </li>
                              <li>
                                <a class="dropdown-item" href="javascript:;" onclick="largeModal('{{ route('admin.student.id_card', ['id' => $student->id]) }}', '{{ get_phrase('') }}')">{{ get_phrase('Xem chi tiết học viên') }}</a>
                              </li>


                              <li>
                                <a class="dropdown-item" href="javascript:;" onclick="confirmModal('{{ route('admin.student.delete', ['id' => $student->id]) }}', 'undefined');">{{ get_phrase('Xóa') }}</a>
                              </li>
                            </ul>
                          </div>
                        </td>
                      </tr>
                    @endforeach
                </tbody>
              </table>

              <div
                  class="admin-tInfo-pagi d-flex justify-content-md-between justify-content-center align-items-center flex-wrap gr-15"
                >
                  <p class="admin-tInfo">{{ get_phrase('Hiển thị').' 1 - '.count($students).' '.get_phrase('trong').' '.$students->total().' '.get_phrase('học viên') }}</p>
                  <div class="admin-pagi">
                    {!! $students->appends(request()->all())->links() !!}
                  </div>
                </div>
              </div>
              
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

@if(count($students) > 0)
<!-- Table -->
<div class="table-responsive student_list display-none-view" id="student_list">
  <table class="table eTable eTable-2">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">{{ get_phrase('Tên') }}</th>
        <th scope="col">{{ get_phrase('Email') }}</th>
        <th scope="col">{{ get_phrase('Thông tin cá nhân') }}</th>
    </thead>
    <tbody>
      @foreach($students as $user)
      <?php 

          $student = DB::table('users')->where('id', $user->id)->first();

          $user_image = get_user_image($user->id);
          $info = json_decode($user->user_information);

          $student_details = (new CommonController)->get_student_academic_info($student->id);
      ?>
        <tr>
          <th scope="row">
            <p class="row-number">{{ $loop->index + 1 }}</p>
          </th>
          <td>
            <div
              class="dAdmin_profile d-flex align-items-center min-w-200px"
            >
              <div class="dAdmin_profile_img">
                <img
                  class="img-fluid"
                  width="50"
                  height="50"
                  src="{{ asset('public/assets') }}/{{ $user_image }}"
                />
              </div>
              <div class="dAdmin_profile_name dAdmin_info_name">
                <h4>{{ $student->name }}</h4>
                <p>
                  <span>{{ get_phrase('Mã nhân viên') }}:</span> {{ $user->code }}
                  <br>
                  <span>{{ get_phrase('Đơn vị') }}:</span> {{ $user->workunit }}
                  <br>
                  <span>{{ get_phrase('Bộ phận') }}:</span> {{ $user->department }}
                </p>
              </div>
            </div>
          </td>
          <td>
            <div class="dAdmin_info_name min-w-250px">
              <p>{{ $student->email }}</p>
            </div>
          </td>
          
        </tr>
      @endforeach
  </tbody>
  </table>
  {!! $students->appends(request()->all())->links() !!}
</div>
@endif


<script type="text/javascript">

  "use strict";

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

  function Export() {

      // Choose the element that our invoice is rendered in.
      const element = document.getElementById("student_list");

      // clone the element
      var clonedElement = element.cloneNode(true);

      // change display of cloned element
      $(clonedElement).css("display", "block");

      // Choose the clonedElement and save the PDF for our user.
    var opt = {
      margin:       1,
      filename:     'student_list_{{ date("y-m-d") }}.pdf',
      image:        { type: 'jpeg', quality: 0.98 },
      html2canvas:  { scale: 2 }
    };

    // New Promise-based usage:
    html2pdf().set(opt).from(clonedElement).save();

      // remove cloned element
      clonedElement.remove();
  }

  function printableDiv(printableAreaDivId) {
    var printContents = document.getElementById(printableAreaDivId).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
  }

</script>
<style type="text/css">

</style>

<!-- End Students area -->
@endsection