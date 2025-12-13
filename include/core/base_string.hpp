//
// Copyright (c) 2025 Toyman Interactive
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this
// software and associated documentation files (the "Software"), to deal in the Software
// without restriction, including without limitation the rights to use, copy, modify, merge,
// publish, distribute, sublicense, and / or sell copies of the Software, and to permit
// persons to whom the Software is furnished to do so, subject to the following conditions :
//
// The above copyright notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
// PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.
//
/*!
  \file   base_string.hpp
  \brief  TODO
*/

#ifndef INCLUDE_CORE_BASE_STRING_HPP_
#define INCLUDE_CORE_BASE_STRING_HPP_

namespace toy {

template <typename storageType>
class BaseString {
public:
  using value_type = char; //!< Type of characters stored in the string.

  using size_type = size_t; //!< Type used for string size and capacity.
  using difference_type = std::ptrdiff_t; //!< Type used for pointer differences.

  using reference = value_type &; //!< Reference to string character.
  using const_reference = const value_type &; //!< Const reference to string character.

  using pointer = value_type *; //!< Pointer to string character.
  using const_pointer = const value_type *; //!< Const pointer to string character.

  using iterator = value_type *; //!< Iterator type for string characters.
  using const_iterator = const value_type *; //!< Const iterator type for string characters.

  //! Reverse iterator type for string characters.
  using reverse_iterator = std::reverse_iterator<iterator>;
  //! Const reverse iterator type for string characters.
  using const_reverse_iterator = std::reverse_iterator<const_iterator>;

  /*!
    \brief Default constructor.

    \post The string is empty and ready for use.
  */
  constexpr BaseString() noexcept = default;

  /*!
    \brief Destructor for the fixed string.
  */
  constexpr ~BaseString() noexcept = default;

  /*!
    \brief Constructs a string of the given \a count of \a character.

    This constructor initializes a string with a \a character repeated the given \a count of times.

    \param count     The number of times to repeat the \a character.
    \param character The character to repeat.

    \pre The \a count must not exceed the allocated size.

    \post The new string is created with the contents of the \a character repeated the given \a count of times.
    \post The string size equals the \a count.

    \note This is useful for creating strings with repeated patterns or filling with specific characters.
  */
  constexpr BaseString(size_type count, char character) noexcept;

protected:
  /// Internal character buffer storing the string data
  storageType _storage;
};

} // namespace toy

#endif // INCLUDE_CORE_BASE_STRING_HPP_
