<template>
  <div class="products">
    <h1 class="products__title">Список товаров</h1>
    <div class="products__grid">
      <div class="product" v-for="product in products" :key="product.id">
        <h2 class="product__name">{{ product.name }}</h2>
        <img class="product__image" :src="product.image" alt="">
        <div class="product__group">
          <p class="product__price">{{ product.price }}</p>
          <button class="product__button" @click="addToCart" :data-id="product.id">
            <svg class="product__button-icon" viewBox="0 0 511.343 511.343">
              <path d="m490.334 106.668h-399.808l-5.943-66.207c-.972-10.827-10.046-19.123-20.916-19.123h-42.667c-11.598 0-21 9.402-21 21s9.402 21 21 21h23.468c12.825 142.882-20.321-226.415 24.153 269.089 1.714 19.394 12.193 40.439 30.245 54.739-32.547 41.564-2.809 102.839 50.134 102.839 43.942 0 74.935-43.826 59.866-85.334h114.936c-15.05 41.455 15.876 85.334 59.866 85.334 35.106 0 63.667-28.561 63.667-63.667s-28.561-63.667-63.667-63.667h-234.526c-15.952 0-29.853-9.624-35.853-23.646l335.608-19.724c9.162-.538 16.914-6.966 19.141-15.87l42.67-170.67c3.308-13.234-6.71-26.093-20.374-26.093zm-341.334 341.337c-11.946 0-21.666-9.72-21.666-21.667s9.72-21.667 21.666-21.667c11.947 0 21.667 9.72 21.667 21.667s-9.72 21.667-21.667 21.667zm234.667 0c-11.947 0-21.667-9.72-21.667-21.667s9.72-21.667 21.667-21.667 21.667 9.72 21.667 21.667-9.72 21.667-21.667 21.667zm47.366-169.726-323.397 19.005-13.34-148.617h369.142z"/>
            </svg>
            Купить
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { map } from '@/modules/utils';

export default {
  name: 'List',
  data() {
    return {
      products: []
    }
  },
  async mounted() {
    const response = await fetch('/catalog.json');
    const data = await response.json();

    this.products = data;
  },
  methods: {
    addToCart(event) {
      const cartMap = map(JSON.parse(localStorage.getItem('cart')) || [], 'id');
      const id = event.target.dataset.id;

      if (id !== null) {
        if (cartMap.has(id)) {
          cartMap.get(id).count++;
        } else {
          cartMap.set(id, {
            id,
            count: 1
          });
        }

        localStorage.setItem('cart', JSON.stringify([...cartMap.values()]));
      }
    }
  }
};
</script>

<style scoped>
.products {
  padding: 24px;
}

.products__title {
  margin: 0 0 12px 0;
  font-weight: 500;
  font-size: 1.5em;
}

.products__grid {
  gap: 24px;
  display: grid;
  grid-template-columns: repeat(auto-fit, 270px);
  justify-content: center;
}

.product {
  --shadow-color: rgba(0, 0, 0, 0.1);

  padding: 10px;
  gap: 10px;
  border-radius: 4px;
  display: grid;
  background: #ffffff;
  box-shadow: 0 2px 2px var(--shadow-color),
              0 4px 4px var(--shadow-color),
              0 8px 8px var(--shadow-color);
}

.product__name {
  margin: 0;
  font-weight: 500;
  font-size: 1.25em;
  text-align: center;
}

.product__image {
  margin: 0 auto;
  border-radius: 4px;
  display: block;
}

.product__group {
  gap: 10px;
  display: grid;
  grid-auto-flow: column;
  grid-auto-columns: 1fr;
}

.product__price {
  margin: 0;
  font-size: 1.5em;
}

.product__button {
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  display: flex;
  font: inherit;
  background: #1fb826;
  color: #ffffff;
}

.product__button-icon {
  width: 20px;
  height: 20px;
  margin-right: 10px;
  display: block;
  fill: currentColor;
}
</style>