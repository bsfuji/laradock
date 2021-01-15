<?php

namespace App\Http\Controllers\Api\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        if (!Auth::attempt($credentials)) {
            return response()->json([
                'code' => 401,
                'message' => 'Unauthorized.'
            ], 401); 
        }

        $user = Auth::user();
        $user->update(['api_token' => Str::random(60)]);

        return response()->json([
            'code' => 200,
            'user' => $user
        ], 200);
    }

    public function logout(Request $request)
    {
        $request->user()->update(['api_token' => null]);

        return response()->json([
            'code' => 201
        ], 201);
    }
}
