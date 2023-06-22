// recipes.js
document.addEventListener('DOMContentLoaded', () => {
  const addIngredientButton = document.getElementById('add-ingredient');
  const ingredientContainer = document.querySelector('#ingredients');

  addIngredientButton.addEventListener('click', (event) => {
    event.preventDefault();
    addIngredientFields();
  });

  ingredientContainer.addEventListener('click', (event) => {
    if (event.target.classList.contains('remove-ingredient')) {
      event.preventDefault();
      removeIngredientFields(event.target);
    }
  });

  function addIngredientFields() {
    const time = new Date().getTime();
    const regex = new RegExp('new_ingredients', 'g');
    const ingredientFields = document.createElement('div');
    ingredientFields.classList.add('nested-fields');

    ingredientFields.innerHTML = `
      <%= form.fields_for :ingredients, Ingredient.new, child_index: 'new_ingredients' + time do |ingredient_fields| %>
        <%= render 'ingredient_fields', f: ingredient_fields %>
      <% end %>
    `;

    ingredientContainer.appendChild(ingredientFields);
  }

  function removeIngredientFields(link) {
    link.closest('.nested-fields').remove();
  }
});
