<template>
	<view class="list_menu">
		<view v-if="$check_action(o[vm.url],'get')" v-for="(o, i) in list_menu" :key="i" class="item_menu">
			<navigator :url="'/pages'+o[vm.url]" class="menu" hover-class="hover">
				<image class="image" :src="$fullImgUrl(o[vm.img])" mode="widthFix"></image>
				<text class="name">{{ o[vm.name] }}</text>
			</navigator>
		</view>
	</view>
</template>

<script>
	import mixin from "@/mixins/component.js"
	export default {
		mixins:[mixin],
		props: {
			list_menu: {
				type: Array,
				default: function() {
					return [];
				}
			},
			vm: {
				type: Object,
				default: function() {
					return {
						img: "img",
						name: "mod_name",
						url: "path"
					}
				}
			}
		},
		methods:{
		}
	}
</script>

<style>
	.list_menu image {
		border-radius: 1rem;
	}

	.list_menu {
		display: flex;
		justify-content: flex-start;
		flex-wrap: wrap;
		text-align: center;
		background-color: #fff;
		padding: 0.5rem 0;
	}
	.list_menu .item_menu {
		flex: 0 0 25%;
	}
	@media (min-width:768px){
		.list_menu .item_menu {
			flex: 1;
		}
	}

	.list_menu .menu text {
		font-size: 1rem;
	}
	.list_menu .menu image{
		 width: 100%;
		 height: 100%;
	}
	.list_menu .menu image:hover{
		transform: scale(1.2);
		transition: 0.2 all;
	}
</style>
