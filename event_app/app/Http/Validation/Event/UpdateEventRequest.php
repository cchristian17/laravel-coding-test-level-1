<?php

namespace App\Http\Validation\Event;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\ValidationException;

class UpdateEventRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    protected function failedValidation(Validator $validator)
    {
        $response = new JsonResponse([
            'message' => $validator->errors(),
        ], 400);

        throw new ValidationException($validator, $response);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'nullable|sometimes|string|min:6|max:255|unique:events,name',
            'venue' => 'nullable|sometimes|string',
            'description' => 'nullable|sometimes|string',
            'start_at' => 'nullable|sometimes|date_format:Y-m-d',
            'end_at' => 'nullable|sometimes|date_format:Y-m-d|after:start_date',
        ];
    }
}
