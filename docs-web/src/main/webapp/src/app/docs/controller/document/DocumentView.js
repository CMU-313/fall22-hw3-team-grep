'use strict';

/**
 * Document view controller.
 */
angular.module('docs').controller('DocumentView', function ($scope, $rootScope, $state, $stateParams, $location, $dialog, $uibModal, Restangular, $translate) {
  // Load document data from server
  Restangular.one('document', $stateParams.id).get().then(function (data) {
    $scope.document = data;
  }, function (response) {
    $scope.error = response;
  });

  // Load comments from server
  Restangular.one('comment', $stateParams.id).get().then(function (data) {
    $scope.comments = data.comments;
  }, function (response) {
    $scope.commentsError = response;
  });

  /**
   * Add a comment.
   */
  $scope.comment = '';
  $scope.addComment = function () {
    if ($scope.comment.length === 0) {
      return;
    }

    Restangular.one('comment').put({
      id: $stateParams.id,
      content: $scope.comment
    }).then(function (data) {
      $scope.comment = '';
      $scope.comments.push(data);
    });
  };

  /**
   * Delete a comment.
   */
  $scope.deleteComment = function (comment) {
    var title = $translate.instant('document.view.delete_comment_title');
    var msg = $translate.instant('document.view.delete_comment_message');
    var btns = [
      {result: 'cancel', label: $translate.instant('cancel')},
      {result: 'ok', label: $translate.instant('ok'), cssClass: 'btn-primary'}
    ];

    $dialog.messageBox(title, msg, btns, function (result) {
      if (result === 'ok') {
        Restangular.one('comment', comment.id).remove().then(function () {
          $scope.comments.splice($scope.comments.indexOf(comment), 1);
        });
      }
    });
  };

  /**
   * Delete a document.
   */
  $scope.deleteDocument = function (document) {
    var title = $translate.instant('document.view.delete_document_title');
    var msg = $translate.instant('document.view.delete_document_message');
    var btns = [
      {result: 'cancel', label: $translate.instant('cancel')},
      {result: 'ok', label: $translate.instant('ok'), cssClass: 'btn-primary'}
    ];

    $dialog.messageBox(title, msg, btns, function (result) {
      if (result === 'ok') {
        Restangular.one('document', document.id).remove().then(function () {
          $scope.loadDocuments();
          $state.go('document.default');
        });
      }
    });
  };

  /**
   * Open the share dialog.
   */
  $scope.share = function () {
    $uibModal.open({
      templateUrl: 'partial/docs/document.share.html',
      controller: 'DocumentModalShare'
    }).result.then(function (name) {
          if (name === null) {
            return;
          }

          // Share the document
          Restangular.one('share').put({
            name: name,
            id: $stateParams.id
          }).then(function (acl) {
                // Display the new share ACL and add it to the local ACLs
                $scope.showShare(acl);
                $scope.document.acls.push(acl);
                $scope.document.acls = angular.copy($scope.document.acls);
              })
        });
  };

  /**
   * Display a share.
   */
  $scope.showShare = function (share) {
    // Show the link
    var link = $location.absUrl().replace($location.path(), '').replace('#', '') + 'share.html#/share/' + $stateParams.id + '/' + share.id;
    var title = $translate.instant('document.view.shared_document_title');
    var msg = $translate.instant('document.view.shared_document_message', { link: link });
    var btns = [
      {result: 'close', label: $translate.instant('close')}
    ];

    if ($rootScope.userInfo.username !== 'guest') {
      btns.unshift({result: 'unshare', label: $translate.instant('unshare'), cssClass: 'btn-danger'});
    }

    $dialog.messageBox(title, msg, btns, function (result) {
      if (result === 'unshare') {
        // Unshare this document and update the local shares
        Restangular.one('share', share.id).remove().then(function () {
          $scope.document.acls = _.reject($scope.document.acls, function (s) {
            return share.id === s.id;
          });
        });
      }
    });
  };

  /**
   * Export the current document to PDF.
   */
  $scope.exportPdf = function () {
    $uibModal.open({
      templateUrl: 'partial/docs/document.pdf.html',
      controller: 'DocumentModalPdf'
    });

    return false;
  };

  /**
     * Validate the Resume.
     */
  $scope.validateResume = function (transition) {
    Restangular.one('route').post('validate', {
      documentId: $stateParams.id,
      transition: transition,
      comment: $scope.workflowComment
    }).then(function (data) {
      $scope.workflowComment = '';
      var title = $translate.instant('document.view.workflow_validated_title');
      var msg = $translate.instant('document.view.workflow_validated_message');
      var btns = [{result: 'ok', label: $translate.instant('ok'), cssClass: 'btn-primary'}];
      $dialog.messageBox(title, msg, btns);

      if (data.readable) {
        $scope.document.route_step = data.route_step;
      } else {
        $state.go('document.default');
      }
    });
  };

  /**
   * Validate the workflow.
   */
  $scope.validateWorkflow = function (transition) {
    Restangular.one('route').post('validate', {
      documentId: $stateParams.id,
      transition: transition,
      comment: $scope.workflowComment
    }).then(function (data) {
      $scope.workflowComment = '';
      var title = $translate.instant('document.view.workflow_validated_title');
      var msg = $translate.instant('document.view.workflow_validated_message');
      var btns = [{result: 'ok', label: $translate.instant('ok'), cssClass: 'btn-primary'}];
      $dialog.messageBox(title, msg, btns);

      if (data.readable) {
        $scope.document.route_step = data.route_step;
      } else {
        $state.go('document.default');
      }
    });
  };

  angular
    .module('myModule',['mobiscroll-form']) // creating module and setting dependency
    .controller('myController', ['$scope', function ($scope) {
        $scope.gpaRating = 3;
        $scope.skillsRating = 3;
        $scope.expRating = 3;
  }]);

  angular.module('sliderDemoBasic', ['ngMaterial'])
  .config(function ($mdIconProvider) {
    $mdIconProvider.iconSet('device', 'img/icons/sets/device-icons.svg', 24);
  })
  .controller('AppCtrl', function ($scope) {
    $scope.color = {
      red: Math.floor(Math.random() * 255),
      green: Math.floor(Math.random() * 255),
      blue: Math.floor(Math.random() * 255)
    };

    $scope.rating1 = 3;
    $scope.rating2 = 2;
    $scope.rating3 = 4;

    $scope.disabled1 = Math.floor(Math.random() * 100);
    $scope.disabled2 = 0;
    $scope.disabled3 = 70;

    $scope.invert = Math.floor(Math.random() * 100);

    $scope.isDisabled = true;
  });
});