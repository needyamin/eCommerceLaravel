<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductImage>
 */
class ProductImageFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'product_id' => null, // set in seeder
            'path' => 'https://picsum.photos/seed/' . $this->faker->uuid . '/600/450',
            'position' => 0,
            'is_primary' => false,
        ];
    }
}
