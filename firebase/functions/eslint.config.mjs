// @ts-check
import eslint from '@eslint/js';
import tseslint from 'typescript-eslint';
import pluginImport from 'eslint-plugin-import';
// import google from 'eslint-config-google'; // Compatibility needs verification

export default tseslint.config(
  // 1. Global ignores (applies to all subsequent configs)
  {
    ignores: [
      "lib/**/*", // Ignore built files.
      "eslint.config.mjs", // Ignore this config file from typed linting
    ],
  },

  // 2. ESLint's recommended configuration for JS files (and as a base)
  eslint.configs.recommended,

  // 3. TypeScript ESLint's recommended configurations (this is an array, so spread it)
  ...tseslint.configs.recommended,

  // 4. Custom configuration for TypeScript files (src/**/*.ts)
  // This object allows us to specify settings that only apply to TS files,
  // especially project-specific parsing.
  {
    files: ["src/**/*.ts"], // Target only TypeScript files in the src directory
    plugins: {
      import: pluginImport,
      // '@typescript-eslint' is implicitly available via tseslint.configs.recommended
    },
    languageOptions: {
      // parser: tseslint.parser, // Already set by tseslint.configs.recommended
      parserOptions: {
        project: "tsconfig.json", // Correct path, relative to eslint.config.mjs or tsconfigRootDir
        sourceType: "module",
        // tsconfigRootDir: import.meta.dirname, // if tsconfig.json is in the same dir as eslint.config.mjs
      },
    },
    rules: {
      // Specific rules for your TypeScript code
      "quotes": ["error", "double"],
      "import/no-unresolved": "off", // Using "off" as "0" is deprecated for rule severity
      // Add any other rules from your old .eslintrc.js that are still relevant
      // Consider if `eslint-config-google` rules are needed and how to integrate them.
      // For example, if google.rules is an object:
      // ...google.rules,
    },
  }
  // If you had other specific configs, like for .js files with different rules, add them as separate objects.
);
