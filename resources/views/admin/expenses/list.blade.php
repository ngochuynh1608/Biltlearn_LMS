<?php 

use App\Models\ExpenseCategory;

?>
@if(count($expenses) > 0)
<div class="table-responsive expense_report" id="expense_report">
    <table id="basic-datatable" class="table eTable">
        <thead>
          <tr>
            <th>{{ get_phrase('Ngày') }}</th>
            <th>{{ get_phrase('Số tiền') }}</th>
            <th>{{ get_phrase('Mục chi') }}</th>
            <th class="text-end">{{ get_phrase('Tùy chọn') }}</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($expenses as $expense): ?>
            <tr>
                <td>
                    {{ date('d/m/Y', $expense['date']) }}
                </td>
                <td>
                    {{ school_currency($expense['amount']) }}
                </td>
                <td>
                    <?php $expense_categories = ExpenseCategory::find($expense['expense_category_id']); ?>
                    {{ $expense_categories['name'] }}
                </td>
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
                            <a class="dropdown-item" href="javascript:;" onclick="rightModal('{{ route('admin.edit.expenses', ['id' => $expense->id]) }}', '{{ get_phrase('Edit Expense') }}')">{{ get_phrase('Chỉnh sửa') }}</a>
                          </li>
                          <li>
                            <a class="dropdown-item" href="javascript:;" onclick="confirmModal('{{ route('admin.expense.delete', ['id' => $expense->id]) }}', 'undefined');">{{ get_phrase('Xóa') }}</a>
                          </li>
                        </ul>
                    </div>
                </td>
            </tr>
          <?php endforeach; ?>
        </tbody>
    </table>
</div>
@else
    <div class="empty_box center">
        <img class="mb-3" width="150px" src="{{ asset('public/assets/images/empty_box.png') }}" />
        <br>
        <span class="">{{ get_phrase('Không có dữ liệu') }}</span>
    </div>
@endif
