<template>
  <div>
    <ul>
      <li v-for="board in boards" :key="board.id">
        {{ board.title }}
        <a :href="'/boards/' + board.id" data-confirm="真的要刪除嗎？" data-method="delete">刪除</a>
      </li>
    </ul>
  </div>
</template>

<script>
import Rails from "@rails/ujs";

export default {
  data: function() {
    return {
      boards: []
    }
  },
  beforeCreate: function() {
    Rails.ajax({
      url: "/api/v2/boards.json",
      type: "GET",
      success: (data) => {
        this.boards = data;
      },
      error: function(err) {
        console.log("!")
      }
    });
  }
}
</script>

<style scoped>
li {
  font-size: 18px;
}
</style>
