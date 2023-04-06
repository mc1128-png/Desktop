<script>
	export default {
		onLaunch: function() {
			console.log('App Launch')
		},
		onShow: function() {
			console.log('App Show')
			var token = uni.db.get("token")
			this.$store.commit("user_set", {
				token: token
			})
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>


<style>
	@import url("./static/css/theme.css");
	@import url("./static/css/common.css");
	@import "./static/css/diy.css";

	view {
		box-sizing: border-box;
	}

	body {
		font-family: Arial, Helvetica, sans-serif;
	}

	uni-page-body {
		height: 100%;
	}

	html {
		font-size: 16px !important;
	}

	page {
		background-color: #F8F8F8;
	}

	uni-page-head .uni-page-head{
		z-index: 5000;
	}

	.uni-top-window{
		z-index: 5000;
	}

	.uni-scroll-view ::-webkit-scrollbar{
		display: none;
	}

	.page_account {
		height: 100%;
	}

	.page_account .mm_warp {
		background: url(static/img/bg_account.jpg) no-repeat;
		background-size: 100% 100%;
		min-height: 100vh;
	}

	.banner_container {
		margin: 0;
	}

	.container {
		margin: 0 auto;
	}


	@media (max-width:576px) {
		.container {
			margin: 0 var(--margin_base);
		}
	}

	@media (min-width: 1200px) {
		uni-tabbar.uni-tabbar-bottom {
			position: initial;
			display: none;
		}

		uni-page-head {
			display: none;
		}

		uni-page-wrapper {
			height: 100% !important;
		}

		body {
			height: 100%;
		}
	}

	[class^="btn_"] {
		cursor: pointer;
	}

	.pages-cart-index {
		overflow: hidden;
	}

	.pages-cart-list {
		overflow: hidden;
	}

	/*每个页面公共css */
	.container {
		padding: 0;
	}

	.ql-container {
		box-sizing: border-box;
		width: 100%;
		height: 100%;
		font-size: 16px;
		line-height: 1.5;
		overflow: auto;
		padding: 20px 10px 20px 10px;
	}

	.ql-active {
		color: #22C704;
	}

	.iconfont {
		display: inline-block;
		width: 32px;
		height: 30px;
		cursor: pointer;
		font-size: 20px;
	}

	.toolbar {
		box-sizing: border-box;
		padding: 10px;
		height: 130px;
		width: 100%;
		position: fixed;
		left: 0;
		top: 0;
		background: #fff;
		right: 100%;
		display: flex;
		flex-wrap: wrap;
		text-align: center;
		border-bottom: 1rpx solid #eee;
	}

	.button {
		margin-left: 1rem;
		margin-right: 1rem;
	}

	.input-group {
		display: flex;
	}

	.input-group>* {
		width: 100%;
	}

	.input-group .is-input-border {
		border-top-right-radius: 0 !important;
		border-bottom-right-radius: 0 !important;
	}

	.input-group button {
		flex: 1;
		font-size: 0.875rem;
		padding: 0;
		border-top-left-radius: 0 !important;
		border-bottom-left-radius: 0 !important;
		border-left: none;
	}

	.input-group button:after {
		border-top-left-radius: 0 !important;
		border-bottom-left-radius: 0 !important;
		border-left: none;
	}

	.list_comment .uni-ellipsis {
		white-space: initial !important;
	}

	.btn {
		position: relative;
		display: block;
		margin-left: auto;
		margin-right: auto;
		padding-left: 14px;
		padding-right: 14px;
		box-sizing: border-box;
		font-size: 18px;
		text-align: center;
		text-decoration: none;
		line-height: 2.55555556;
		border-radius: 5px;
		-webkit-tap-highlight-color: transparent;
		overflow: hidden;
		color: #000;
		background-color: #f8f8f8;
		border: 1px solid rgba(0, 0, 0, .1);
		cursor: pointer;
	}

    .form_editor_block  svg{
        display: block;
        width: 16px !important;
        height: 16px !important;
    }
</style>
