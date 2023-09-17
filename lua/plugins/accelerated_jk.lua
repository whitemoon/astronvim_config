return {
  {
    "rainbowhxch/accelerated-jk.nvim",
    opts = {
      mode = "time_driven",
      acceleration_motions = { "h", "l", "j", "k", "e", "b" },
      acceleration_limit = 150,
      acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
      enable_deceleration = false,
      deceleration_table = { { 150, 9999 } },
    },
  },
}
