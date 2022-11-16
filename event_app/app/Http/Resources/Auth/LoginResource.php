<?php

namespace App\Http\Resources\Auth;

use Illuminate\Http\Resources\Json\JsonResource;

class LoginResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'user' => [
                'id' => $this->id,
                'email' => $this->email,
                'name' => $this->name,
                'phone_number' => $this->phone_number,
            ],
            'token' => $this->createToken('userToken')->accessToken
        ];
    }
}
