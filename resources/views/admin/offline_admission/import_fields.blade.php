@extends('admin.navigation')
   
@section('content')
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
                <form class="form-horizontal" method="POST" action="{{ route('admin.offline_admission.create_excel') }}">
                    {{ csrf_field() }}
                    <table class="table">

                        @foreach ($csv_data as $row)
                            <tr>
                            @foreach ($row as $key => $value)
                                <td>{{ $value }}</td>
                            @endforeach
                            </tr>
                        @endforeach
                    </table>
                    <table>
                        @foreach ($table_users as $key => $value)
                        <tr>
                            <td>{{ $value }}</td>
                            <td>
                                <select class="form-select" name="fields[{{ $key }}]">
                                    @foreach ($csv_data[0] as $key => $value)
                                        <option>{{ $value }}</option>
                                    @endforeach
                                </select>
                            </td>
                            
                        </tr>
                        @endforeach
                    </table>

                    <button type="submit" class="btn btn-primary">
                        Nhập dữ liệu
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection
