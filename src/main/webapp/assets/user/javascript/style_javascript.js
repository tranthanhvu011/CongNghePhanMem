/* tạo nút back to top*/
$(document).ready(function() {
    $('#backtop').hide(); // ẩn nút go-to-top
    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) { //thực hiện lệnh điều kiện Khi lăn chuột xuống dưới hơn 100px
            $('#backtop').slideDown(300); //Xuất hiện nút
        } else {
            $('#backtop').fadeOut(300); //Ngược lại thì ẩn nút
        }
    });
    $('#backtop').click(function() {
        $('html, body').animate({ scrollTop: 0 }, 900); //Animation giúp hoạt ảnh scroll ngược lên đầu trang sẽ mượt hơn
    });
});



/*tạo hieu ung menu*/
$(document).ready(function() {
    var chieucao;
    var t = document.getElementsByTagName("header").value;
    if (t == undefined) { // kiem tra xem trang co ton tai the header hay khong
        chieucao = parseFloat($("#nav_menu").height()); // khong co ->trang con ->lay chieu cao the nav de xu lí
    } else {
        chieucao = parseFloat($("header").height()); // co -> trang chu ->lay chieu vao the header xu li
    }
    $(window).scroll(function() {
        if ($(this).scrollTop() >= chieucao + 1) {
            $('#nav_menu').addClass("permanent"); // add class
        } else {
            $('#nav_menu').removeClass("permanent"); // remove class
        }
    })
})
// tao hieu ung truot 
document.addEventListener("scroll", function () {
    let sections = document.querySelectorAll(".section");
    
    sections.forEach(function (section) {
      let boundingBox = section.getBoundingClientRect();
      
      // Kiểm tra nếu phần tử hiện tại đang nằm trong tầm nhìn
      if (boundingBox.top <= window.innerHeight * 0.75 && boundingBox.bottom >= window.innerHeight * 0.25) {
        section.style.transform = "scale(1.1)";
      } else {
        section.style.transform = "scale(1)";
      }
    });
  });

$(window).ready(function() {
    $('#hotro').click(function() {
        $('.form-support').slideDown(500);
        $('.form-support').style.display = 'block';
        $('.overlay').style.display = 'block';
    })
    $('#knot').click(function() {
        $('.form-support').hide();
        $('.overlay').style.display = 'none';
    })
})

document.addEventListener('DOMContentLoaded', function() {
    var overlay = document.querySelector('.overlay');
    var product = document.querySelector('.product');
    var hideOverlay = document.querySelectorAll('.test_overlay');
    var close = document.querySelector('.product--close');
    var infoProduct = document.querySelector('.info-dog');
    // Xử lý khi người dùng nhấn nút Đóng
    hideOverlay.forEach(function(element){
        element.addEventListener('click', function() {
            overlay.classList.add('ds-block');
            product.style.display= 'block';
            // const imageSrc = infoProduct.querySelector('img').src;
            // const productName = infoProduct.querySelector('h6').textContent;
            // const productPrice = infoProduct.querySelector('.info-dog--money').textContent;
      
            // Hiển thị thông tin
            // product.querySelector('.product-container img').src = imageSrc;
            // product.querySelector('.product-information h2').textContent = productName;
            // product.querySelector('.product-information .product__money--new').textContent = productPrice;
        });
    });
    // Dong giao dien san pham
    close.addEventListener('click', function(){
        overlay.classList.remove('ds-block');
        product.style.display= 'none';
    });
    // su kien doi mat khau
   const changePasswordButton = document.querySelector('.change_password');
   const passNotify = document.querySelector('.pass-notify');
   const overlayPass = document.querySelector('.overlay__pass');
   const loginButton = document.querySelector('.login_button');
 
   // Sự kiện click nút "Đổi mật khẩu"
   changePasswordButton.addEventListener('click', function() {
     // Ẩn form đổi mật khẩu và hiển thị thông báo
     passNotify.style.display = 'block';
     overlayPass.style.display = 'block';
   });
 
   // Sự kiện click nút "Đăng nhập" trên thông báo
   loginButton.addEventListener('click', function() {
     location.href = './login.html';
   });
});
// Phương thức giảm số lượng
function decreaseQuantity() {
    var quanlityProduct = document.querySelector(".input-text");
    var currentQuantity = parseInt(quanlityProduct.value);
    if (currentQuantity > 0) {
        quanlityProduct.value = currentQuantity - 1;
    }
}

// Phương thức tăng số lượng
function increaseQuantity() {
    var quanlityProduct = document.querySelector(".input-text");
    var currentQuantity = parseInt(quanlityProduct.value);
    quanlityProduct.value = currentQuantity + 1;
}
// xoa san pham
function deleteProduct(button) {
    const product = button.closest('.header__cart-product-sp');
    if (product) {
      const list = document.getElementById('productList');
      const productHeight = product.clientHeight;
      product.remove();
  
      const remainingProducts = list.querySelectorAll('.header__cart-product-sp');
  
      for (let i = 0; i < remainingProducts.length; i++) {
        remainingProducts[i].style.transform = `translateY(0)`;
      }
    }
  }  
  // tao su kien chay san pham
  $(document).ready(function() {
    $(".list-dog.hot-pets").each(function() {
        var section = $(this);
        var items = section.find(".item-pet");
        var numItems = items.length;
        var itemsToShow = 4;
        var currentIndex = 0;

        function updateVisibleItems() {
            items.css("display", "none");
            for (var i = 0; i < itemsToShow; i++) {
                var indexToShow = (currentIndex + i) % numItems;
                items.eq(indexToShow).css("display", "block");
            }
        }

        section.find(".nextBtn").click(function(event) {
            event.preventDefault();
            currentIndex = (currentIndex + 1) % numItems;
            updateVisibleItems();
        });

        section.find(".prevBtn").click(function(event) {
            event.preventDefault();
            currentIndex = (currentIndex - 1 + numItems) % numItems;
            updateVisibleItems();
        });

        updateVisibleItems();
    });
});
function addComment() {
    var userName = "Your Name"; // Thay bằng cách lấy tên đăng nhập hoặc tên người dùng thực tế
    var userReview = document.getElementById("userReview").value;
    var selectedStar = document.getElementById("selectedStar").value;

    // Kiểm tra xem đã chọn số sao chưa
    if (selectedStar === "0") {
        alert("Vui lòng chọn số sao trước khi gửi đánh giá.");
        return;
    }

    // Tạo một đối tượng bình luận mới
    var newComment = document.createElement("div");
    newComment.className = "comment";

    var commentInfo = document.createElement("div");
    commentInfo.className = "comment-info";

    var userNameElement = document.createElement("h3");
    userNameElement.appendChild(document.createTextNode(userName));
    commentInfo.appendChild(userNameElement);

    var rating = document.createElement("div");
    rating.className = "rating";

    // Thêm số sao vào đánh giá
    for (var i = 0; i < selectedStar; i++) {
        var star = document.createElement("span");
        star.innerHTML = "&#9733;";
        rating.appendChild(star);
    }

    commentInfo.appendChild(rating);

    var commentText = document.createElement("p");
    commentText.className = "comment-text";
    commentText.appendChild(document.createTextNode(userReview));

    // Thêm bình luận mới vào danh sách
    newComment.appendChild(commentInfo);
    newComment.appendChild(commentText);

    var commentList = document.getElementById("comment-list");
    commentList.prepend(newComment);

    var replyButton = document.createElement("button");
    replyButton.appendChild(document.createTextNode("Trả lời"));
    replyButton.onclick = function () {
        alert("Chức năng trả lời sẽ được thêm ở đây.");
    };

    // Thêm nút "Trả lời" vào bình luận mới
    newComment.appendChild(replyButton);

    // Xóa nội dung trong ô đánh giá sau khi gửi
    document.getElementById("userReview").value = "";

    // Reset số sao về 0
    document.getElementById("selectedStar").value = "0";
}
function handleStarClick(starValue) {
    // Cập nhật giá trị số sao đã chọn
    document.getElementById("selectedStar").value = 6 - starValue;

    // Cập nhật hiển thị số sao trên dòng "Đánh giá và nhận xét từ người dùng"
    var reviewText = document.getElementById("reviewText");
    reviewText.innerHTML = "Đánh giá và nhận xét từ người dùng: " + "&#9733;".repeat( 6- starValue);
}
// add To cart
 function addToCart(){
    alert('Sản phẩm đã được thêm vào giỏ hàng!');
 };


var thisPage = 1;
var limit = 20;
var list = document.querySelectorAll('.pagination-list .info-dog');
function loadItems() {
    var beginGet = limit * (thisPage - 1);
    var endGet = limit * thisPage - 1;
    list.forEach((item,key) => {
        if(key >= beginGet && key <= endGet) {
            item.style.display = 'block';
        } else {
            item.style.display = 'none';
        }
    })
    // Tính vị trí trang hiện tại
    listPage();
}

loadItems();
function listPage() {
    var count = Math.ceil(list.length / limit); // tổng số trang 
    document.querySelector('.pagination').innerHTML = '';

    if (thisPage != 1) {
        var prev = document.createElement('li');
        var startPage = document.createElement('li');
        startPage.innerHTML = '<i class="fa-solid fa-backward-fast"></i>';
        prev.innerHTML = '<i class="fa-solid fa-arrow-left"></i>';
        prev.setAttribute('onclick', "changePage(" + (thisPage - 1) + ")");
        startPage.setAttribute('onclick', "changePage(" + 1 + ")");
        document.querySelector('.pagination').appendChild(startPage);
        document.querySelector('.pagination').appendChild(prev);
    }

    // Chỉ show tối đa 10 nút chuyển trang thôi
    var start = Math.floor((thisPage - 1) / 10) * 10 + 1;
    var end = start + 9;
    if (end > count) {
        end = count;
    }


    for (var i = start; i <= end; i++) {
        var newPage = document.createElement('li');
        newPage.innerHTML = i;
        if (i == thisPage) {
            newPage.classList.add('is_active');
        }
        newPage.setAttribute('onclick', "changePage(" + i + ")");
        document.querySelector('.pagination').appendChild(newPage);
    }

    if (thisPage != count) {
        var next = document.createElement('li');
        next.innerHTML = '<i class="fa-solid fa-arrow-right"></i>';
        next.style.margin = '0,auto';
        next.setAttribute('onclick', "changePage(" + (thisPage + 1) + ")");
        document.querySelector('.pagination').appendChild(next);
    }

    var endPage = document.createElement('li');
    endPage.innerHTML = '<i class="fa-solid fa-backward-fast fa-rotate-180"></i>';
    endPage.setAttribute('onclick', "changePage(" + count + ")");
    document.querySelector('.pagination').appendChild(endPage);
}

function changePage(i) {
    thisPage = i;
    loadItems();
}
