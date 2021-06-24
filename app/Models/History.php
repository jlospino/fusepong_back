<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    use HasFactory;

    public $table = 'historys';

    public function tickets() {
        return $this->hasMany(Ticket::class, 'history_id', 'id');
    }
}
