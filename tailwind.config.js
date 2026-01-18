/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./public/**/*.{html,js}"],
  theme: {
    extend: {
      fontFamily: {
        sans: ['"Plus Jakarta Sans"', 'sans-serif'],
      },
      colors: {
        navy: '#0f172a',
        slate: '#64748b',
        light: '#f8fafc',
        accent: '#3b82f6', // Blue 500
      }
    },
  },
  plugins: [],
}